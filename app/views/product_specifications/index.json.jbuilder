# frozen_string_literal: true

json.array! @product_specifications, partial: 'product_specifications/product_specification', as: :product_specification
