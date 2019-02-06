class AddUserToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :user, foreign_key: true
  end
end
