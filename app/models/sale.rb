class Sale < ApplicationRecord
	belongs_to :client
	has_many :orders,inverse_of: :sale
	accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

	validate :validation_of_quant
	validates :sale_date, presence: true
	validates :client, presence: true


	def validation_of_quant
		self.orders.each do |ord|
			if ord.product.quantity < ord.quant
				errors.add(:order, "não tem essa quantidade!!!!")
			else
				self.orders.each do |ord|
				  product_edit = Product.find_by(id: ord.product.id)#pegando o item
				  product_quant = product_edit.quantity#pegando a quantidade atual do item
				  product_edit.update(quantity: product_quant - ord.quant) #atualizando o produto
				end				
			end
		end
	end

end
