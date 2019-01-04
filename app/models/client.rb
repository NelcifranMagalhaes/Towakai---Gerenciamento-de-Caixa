class Client < ApplicationRecord
	has_many :products
	validates :name,presence: true
	validates :address,presence: true
end
