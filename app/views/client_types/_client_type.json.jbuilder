# frozen_string_literal: true

json.extract! client_type, :id, :name, :tax_discount, :created_at, :updated_at
json.url client_type_url(client_type, format: :json)
