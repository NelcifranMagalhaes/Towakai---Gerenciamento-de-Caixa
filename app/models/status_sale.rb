class StatusSale < ApplicationRecord
	validates :name,presence: true


	def name_upper
		"#{self.name.upcase}"
	end
end
