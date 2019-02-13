class ClientType < ApplicationRecord
	validates :name,presence: true


	def name_to_upcase
		"#{self.name.upcase}"
	end
end
