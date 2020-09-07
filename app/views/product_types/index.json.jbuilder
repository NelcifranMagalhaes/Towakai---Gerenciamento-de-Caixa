# frozen_string_literal: true

json.array! @product_types, partial: 'product_types/product_type', as: :product_type
