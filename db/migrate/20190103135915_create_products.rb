class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :cost_price
      t.float :tax
      t.float :sale_price
      t.string :name
      t.integer :quantity
      t.timestamps
    end
  end
end
