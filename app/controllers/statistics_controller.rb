class StatisticsController < ApplicationController
	def index
		all_sales = Sale.all
		product_ids = Array.new
		#Pega os Ids das vendas
		all_sales.each do |sale|
			sale.orders.each do |order|
				product_ids.push(order.product.id)
			end
		end

		@most_frequent_item = product_ids.uniq.max_by{ |i| product_ids.count( i ) }#acha o id mais vendido
		@most_frequent_item = Product.find_by(id: @most_frequent_item) #Acha o produto mais vendido

		@sales = all_sales.group_by_month(:sale_date).count

	end
end