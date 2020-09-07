# frozen_string_literal: true

class AddColorToProductType < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :color, :string
  end
end
