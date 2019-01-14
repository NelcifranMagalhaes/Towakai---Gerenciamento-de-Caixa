class Order < ApplicationRecord
	belongs_to :sale
	belongs_to :product
	validates_associated :product

end
