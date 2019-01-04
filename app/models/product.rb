class Product < ApplicationRecord
	has_many :clients
	validates :name,presence: true
	validates :cost_price,presence: true
	validates :tax,presence: true
	validates :sale_price,presence: true
	validates :value,presence: true
end
