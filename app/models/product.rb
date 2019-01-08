class Product < ApplicationRecord
	has_many :orders
	validates :name,presence: true
	validates :cost_price,presence: true
	validates :tax,presence: true
	validates :sale_price,presence: true
	validates :quantity,presence: true
end