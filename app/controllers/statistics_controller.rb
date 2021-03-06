# frozen_string_literal: true

class StatisticsController < ApplicationController
  def index
    today_date = Date.today
    all_sales = Sale.without_encomendas(today_date.month, today_date.year) # Todas as vendas no Mês atual
    product_ids = []
    total_value_sales = 0

    # Pega os Ids das vendas
    all_sales.each do |sale|
      sale.orders.each do |order|
        product_ids.push(order.product.id)
        total_value_sales += (order.price_saled * order.quant)
      end
    end
    @most_frequent_item = product_ids.uniq.max_by { |i| product_ids.count(i) } # acha o id mais vendido

    @value_total_all_sales = total_value_sales
    @most_frequent_item = Product.find_by(id: @most_frequent_item) # Acha o produto mais vendido
    @sales = Sale.todas(today_date.month, today_date.year) # todas as vendas do Mês
    @total_encomendas = total_encomendas_price(today_date.month, today_date.year) # valor total de todas as encomendas
    @encomendas_size = total_encomendas_for_month(today_date.month, today_date.year)
  end

  def balance
    if params['/balance'].present?
      month = params['/balance']['month'].to_i
      year = params['/balance']['year'].to_i

      if (month.positive? && month < 13) && year.positive?
        all_sales = Sale.without_encomendas(month, year) # Todas as vendas no Mês e Ano atual sem emcomendas
        product_ids = []
        total_value_sales = 0
        # Pega os Ids das vendas
        all_sales.each do |sale|
          sale.orders.each do |order|
            product_ids.push(order.product.id)
            total_value_sales += (order.price_saled * order.quant)
          end
        end
        @most_frequent_item = product_ids.uniq.max_by { |i| product_ids.count(i) } # acha o id mais vendido

        @value_total_all_sales = total_value_sales # total das vendas sem encomendas
        @most_frequent_item = Product.find_by(id: @most_frequent_item) # Acha o produto mais vendido
        @sales = Sale.todas(month, year) # todas as vendas do Mês
        @total_encomendas = total_encomendas_price(month, year) # valor total de todas as encomendas
        @encomendas_size = total_encomendas_for_month(month, year)
      else
        respond_to do |format|
          format.html { redirect_to balance_path, notice: "Preencha corretamente o campo 'Mês' e 'Ano'." }
          format.json { head :no_content }
        end
      end

    end
  end

  private

  # pega uma data e retorna todas as encomendas naquele mẽs e ano da data
  def total_encomendas_price(month, year)
    sales = Sale.encomendas(month, year)
    total_value_sales = 0

    sales.each do |sale|
      sale.orders.each do |order|
        total_value_sales += (order.price_saled * order.quant)
      end
    end
    total_value_sales
  end

  # pega uma data e retorna o número de encomendas naquele mês e ano da data
  def total_encomendas_for_month(month, year)
    sales = Sale.encomendas(month, year)

    sales.size
  end
end
