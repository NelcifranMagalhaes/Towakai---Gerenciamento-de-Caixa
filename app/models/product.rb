class Product < ApplicationRecord
	has_and_belongs_to_many :sales
	
	validates :name,presence: true
	validates :cost_price,presence: true
	validates :tax,presence: true
	validates :sale_price,presence: true
	validates :quantity,presence: true
end