# frozen_string_literal: true

json.array! @status_sales, partial: 'status_sales/status_sale', as: :status_sale
