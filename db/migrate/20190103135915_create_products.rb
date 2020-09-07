# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.monetize :cost_price
      t.monetize :tax
      t.monetize :sale_price
      t.string :name
      t.integer :quantity
      t.timestamps
    end
  end
end
