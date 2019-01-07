class DashboardsController < ApplicationController
	def index
		@products = Product.all
		@clients = Client.all
		@sales = Sale.all
	end
end
