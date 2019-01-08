class Client < ApplicationRecord
	has_many :sales
	validates :name,presence: true
	validates :address,presence: true
end