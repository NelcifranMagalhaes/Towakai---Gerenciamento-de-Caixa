class Product < ApplicationRecord
	has_many :orders
	belongs_to :product_type
	monetize :cost_price_cents
	monetize :sale_price_cents

	validates :name,presence: true
	validates :cost_price,presence: true
	validates :sale_price,presence: true
	validates :quantity,presence: true
	validates :low_quantity,presence: true
	validate :verify_estoque


	def verify_estoque
		if self.quantity <= self.low_quantity
			errors.add(:quantity, "A quantidade do Produto deve ser maior que a quantidade mínima.")
		end
	end

	def name_and_size
		"#{self.name} - #{self.product_type.size}"
	end

end