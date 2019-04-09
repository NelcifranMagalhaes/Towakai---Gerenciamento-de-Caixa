class CreateProductSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :product_specifications do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
