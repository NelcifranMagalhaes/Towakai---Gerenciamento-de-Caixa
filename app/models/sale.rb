class Sale < ApplicationRecord
	belongs_to :client
	belongs_to :user
	belongs_to :status_sale
	has_many :orders,inverse_of: :sale
	accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

	scope :month_sale, -> (month,year) {
		where("EXTRACT(MONTH FROM sale_date) = ? and EXTRACT(YEAR FROM sale_date) = ?","#{month}","#{year}")
	}

	validate :validation_of_quant,on: :create
	validates :sale_date, presence: true
	validates :client, presence: true

	ransacker :sale_date do
	  Arel.sql('date(sale_date)')
	end
	
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

end
