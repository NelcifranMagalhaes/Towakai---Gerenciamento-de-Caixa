# frozen_string_literal: true

class AddProductTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :product_type, foreign_key: true
  end
end
