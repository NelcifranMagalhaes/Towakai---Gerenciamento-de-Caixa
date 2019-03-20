class AddPriceSaledToOrders < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :price_saled
  end
end
