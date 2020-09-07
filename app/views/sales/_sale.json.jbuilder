# frozen_string_literal: true

json.extract! sale, :id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
