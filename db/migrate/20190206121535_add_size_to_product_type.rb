class AddSizeToProductType < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :size, :string
  end
end
