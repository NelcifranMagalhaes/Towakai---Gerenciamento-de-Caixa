class Sale < ApplicationRecord
	belongs_to :client
	has_many :orders,inverse_of: :sale
	accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

	# validates :quant,presence: true
	# validates :sale_date,presence: true
end
