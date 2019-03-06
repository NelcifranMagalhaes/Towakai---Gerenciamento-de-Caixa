class StatisticsController < ApplicationController
	def index
		today_date = Date.today
		all_sales = Sale.month_sale(today_date.month,today_date.year) #Todas as vendas no Mês atual
		product_ids = Array.new
		total_value_sales = 0

		#Pega os Ids das vendas
		all_sales.each do |sale|

			sale.orders.each do |order|
				product_ids.push(order.product.id)

				if sale.status_sale.reference != 0
					total_value_sales = total_value_sales + (order.product.sale_price * order.quant)
				end
			end
		end
		@most_frequent_item = product_ids.uniq.max_by{ |i| product_ids.count( i ) }#acha o id mais vendido


		@value_total_all_sales = total_value_sales
		@most_frequent_item = Product.find_by(id: @most_frequent_item) #Acha o produto mais vendido
		@sales = all_sales.group_by_day(:sale_date).count

	end

	def balance
		if params["/balance"].present?
			month = params["/balance"]["month"].to_i
			year = params["/balance"]["year"].to_i
			
			if (month > 0 && month < 13) && (year > 0)
				all_sales = Sale.month_sale(month,year) #Todas as vendas no Mês e Ano atual
				product_ids = Array.new
				total_value_sales = 0
				#Pega os Ids das vendas
				all_sales.each do |sale|

					sale.orders.each do |order|
						product_ids.push(order.product.id)

						if sale.status_sale.reference != 0
							total_value_sales = total_value_sales + (order.product.sale_price * order.quant)
						end
					end
				end
				@most_frequent_item = product_ids.uniq.max_by{ |i| product_ids.count( i ) }#acha o id mais vendido


				@value_total_all_sales = total_value_sales
				@most_frequent_item = Product.find_by(id: @most_frequent_item) #Acha o produto mais vendido
				@sales = all_sales.group_by_day(:sale_date).count
			else
	        	respond_to do |format|
	        	  format.html { redirect_to balance_path, notice: "Preencha corretamente o campo 'Mês' e 'Ano'." }
	        	  format.json { head :no_content }
	        	end
			end

		end

	end

end