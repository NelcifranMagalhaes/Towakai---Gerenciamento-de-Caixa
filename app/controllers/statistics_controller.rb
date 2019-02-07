class StatisticsController < ApplicationController
	def index
		@sales = Sale.group_by_month(:sale_date).count
	end
end