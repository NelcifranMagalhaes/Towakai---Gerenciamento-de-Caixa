class DashboardsController < ApplicationController
	def index
		@products = Product.all
		@clients = Client.all
		@products_clients = ProductClient.all
	end
end
