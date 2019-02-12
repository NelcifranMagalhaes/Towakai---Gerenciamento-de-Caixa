class Client < ApplicationRecord
	has_many :sales
	belongs_to :client_type
	validates :name,presence: true
	validates :address,presence: true
	validates :email,presence: true
end