class Product < ApplicationRecord
	has_many :orders
	monetize :cost_price_cents
	monetize :sale_price_cents

	validates :name,presence: true
	validates :cost_price,presence: true
	validates :sale_price,presence: true
	validates :quantity,presence: true
	validates :low_quantity,presence: true
end