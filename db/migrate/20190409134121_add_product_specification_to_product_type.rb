class AddProductSpecificationToProductType < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_types, :product_specification, foreign_key: true
  end
end
