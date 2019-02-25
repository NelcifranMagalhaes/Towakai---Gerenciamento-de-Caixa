class StatisticsController < ApplicationController
	def index
		today_date = Date.today.month
		all_sales = Sale.where("EXTRACT(MONTH FROM sale_date) = #{today_date}") #Todas as vendas no Mês atual
		product_ids = Array.new
		total_value_sales = 0
		#Pega os Ids das vendas
		all_sales.each do |sale|

			sale.orders.each do |order|
				product_ids.push(order.product.id)

				if sale.status_sale.reference != 0
					total_value_sales = total_value_sales + order.product.quantity * order.quant
				end
			end
		end
		@most_frequent_item = product_ids.uniq.max_by{ |i| product_ids.count( i ) }#acha o id mais vendido


		@value_total_all_sales = total_value_sales
		@most_frequent_item = Product.find_by(id: @most_frequent_item) #Acha o produto mais vendido
		@sales = all_sales.group_by_day(:sale_date).count

	end
end