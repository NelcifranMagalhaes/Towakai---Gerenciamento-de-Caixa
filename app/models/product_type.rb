class ProductType < ApplicationRecord
	validates :name,presence: true
	validates :code,presence: true

	def name_code_of_product
		"#{self.name.upcase}"
	end
end
