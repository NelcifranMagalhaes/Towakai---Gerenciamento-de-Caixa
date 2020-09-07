# frozen_string_literal: true

json.extract! product, :id, :value, :cost_price, :tax, :sale_price, :name, :created_at, :updated_at
json.url product_url(product, format: :json)
