class Product < ApplicationRecord
	has_many :clients,through: :products_clients
	
	validates :name,presence: true
	validates :cost_price,presence: true
	validates :tax,presence: true
	validates :sale_price,presence: true
	validates :value,presence: true
end
