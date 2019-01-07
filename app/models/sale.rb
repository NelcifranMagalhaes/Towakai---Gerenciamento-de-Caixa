class Sale < ApplicationRecord
	belongs_to :client
	has_and_belongs_to_many :products
	
	validates :client,presence: true
	validates :sale_date,presence: true
end
