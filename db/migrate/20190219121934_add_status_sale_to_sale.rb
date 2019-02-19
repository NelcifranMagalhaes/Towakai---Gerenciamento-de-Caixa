class AddStatusSaleToSale < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :status_sale, foreign_key: true
  end
end
