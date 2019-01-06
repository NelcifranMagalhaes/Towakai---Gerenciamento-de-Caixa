class ProductClient < ApplicationRecord
	belongs_to :client
	has_many :products

	validates :date_sale,presence: true
	
end
