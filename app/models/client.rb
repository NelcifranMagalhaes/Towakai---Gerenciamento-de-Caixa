class Client < ApplicationRecord
	has_many :products,through: :products_clients
	
	validates :name,presence: true
	validates :address,presence: true
end
