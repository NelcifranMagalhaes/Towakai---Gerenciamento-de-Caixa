class Sale < ApplicationRecord
	belongs_to :client
	belongs_to :user
	belongs_to :status_sale
	has_many :orders,inverse_of: :sale
	accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

	scope :month_sale, -> (month,year) {
		where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
	}
	
	scope :encomendas, -> (month,year) {
		joins(:status_sale)
		.where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
		.where(status_sales: {reference: 0})
	}

	scope :enviadas, -> (month,year) {
		joins(:status_sale)
		.where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
		.where(status_sales: {reference: 2})
	}

	scope :without_encomendas, -> (month,year) {
		joins(:status_sale)
		.where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
		.where.not(status_sales: {reference: 0})
	}

	scope :todas, -> (month,year) {
		where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
	}

	validate :validation_of_quant,on: :create
	validates :sale_date, presence: true
	validates :client, presence: true

	ransacker :sale_date do
	  Arel.sql('date(sale_date)')
	end
	
	#valida o produto e caso passe, debita do estoque
	def validation_of_quant
		
		if self.status_sale.present?
			
			if self.status_sale.name != 'Encomenda'
				
				self.orders.each do |ord|
					if (ord.product.quantity < ord.quant) || (ord.quant > ord.product.quantity - ord.product.low_quantity)
						errors.add(:order, "Alguns dos produtos adicionados não possui a quantidade solicitada!!!!")
					else
						self.orders.each do |ord|
						  product_edit = Product.find_by(id: ord.product.id)#pegando o item
						  product_quant = product_edit.quantity#pegando a quantidade atual do item
						  product_edit.update_attribute(:quantity, product_quant - ord.quant) #atualizando o produto
						end				
					end
				end

			end
		end

	end

	def total_price
		total = 0
		self.orders.each do |order|
			total = total + order.product.sale_price * order.quant
		end
		return total
	end

	def total_price_saled
		total = 0
		self.orders.each do |order|
			total = total + order.price_saled * order.quant
		end
		return total
	end

end
