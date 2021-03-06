# frozen_string_literal: true

class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
