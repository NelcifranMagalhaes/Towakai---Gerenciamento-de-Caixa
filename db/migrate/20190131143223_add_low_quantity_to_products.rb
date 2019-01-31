class AddLowQuantityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :low_quantity, :integer
  end
end
