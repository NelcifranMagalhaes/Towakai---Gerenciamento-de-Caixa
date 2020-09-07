# frozen_string_literal: true

json.extract! product_specification, :id, :name, :description, :created_at, :updated_at
json.url product_specification_url(product_specification, format: :json)
