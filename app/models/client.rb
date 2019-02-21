class Client < ApplicationRecord
	has_many :sales
	belongs_to :client_type
	validates :name,presence: true
	validates :address,presence: true
	validates :email,presence: true
	validates :postal_code,presence: true


	def name_with_type
		"#{self.name.upcase} - #{self.client_type.name}"
	end	

	def name_to_upcase
		"#{self.name.upcase}"
	end
end