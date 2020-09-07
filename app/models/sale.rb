# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :status_sale
  belongs_to :payment_type
  has_many :orders, inverse_of: :sale
  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  scope :month_sale, lambda { |month, year|
    where('EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?', month.to_s, year.to_s)
  }

  scope :encomendas, lambda { |month, year|
    joins(:status_sale)
      .where('EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?', month.to_s, year.to_s)
      .where(status_sales: { reference: 0 })
  }

  scope :enviadas, lambda { |month, year|
    joins(:status_sale)
      .where('EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?', month.to_s, year.to_s)
      .where(status_sales: { reference: 2 })
  }

  scope :without_encomendas, lambda { |month, year|
    joins(:status_sale)
      .where('EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?', month.to_s, year.to_s)
      .where.not(status_sales: {reference: 0})
  }

  scope :todas, lambda { |month, year|
    where('EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?', month.to_s, year.to_s)
  }

  validate :validation_of_quant
  validates :sale_date, presence: true
  validates :client, presence: true

  ransacker :sale_date do
    Arel.sql('date(sale_date)')
  end

  # valida o produto e caso passe, debita do estoque
  def validation_of_quant
    if status_sale.present?

      if status_sale.reference == 2 # debita do estoque unicamente se ela for enviada

        orders.each do |ord|
          if (ord.product.quantity < ord.quant) || (ord.quant > ord.product.quantity - ord.product.low_quantity)
            errors.add(:order, 'Alguns dos produtos adicionados não possui a quantidade solicitada!!!!')
          else
            orders.each do |ord|
              product_edit = Product.find_by(id: ord.product.id) # pegando o item
              product_quant = product_edit.quantity # pegando a quantidade atual do item
              product_edit.update_attribute(:quantity, product_quant - ord.quant) # atualizando o produto
            end
          end
        end

      end
    end
  end

  def total_price
    total = 0
    orders.each do |order|
      total += order.product.sale_price * order.quant
    end
    total
  end

  def total_price_saled
    total = 0
    orders.each do |order|
      total += order.price_saled * order.quant
    end
    total
  end
end
