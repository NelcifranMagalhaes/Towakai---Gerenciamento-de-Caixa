class Order < ApplicationRecord
	belongs_to :sale
	belongs_to :product
	monetize :price_saled_cents
	
	validates_associated :product
	validates :price_saled,presence: true
end
