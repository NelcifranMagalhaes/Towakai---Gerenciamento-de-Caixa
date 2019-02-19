class CreateStatusSales < ActiveRecord::Migration[5.2]
  def change
    create_table :status_sales do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
