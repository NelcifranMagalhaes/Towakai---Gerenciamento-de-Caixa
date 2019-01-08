class Order < ApplicationRecord
	belongs_to :sale
	belongs_to :product

end
