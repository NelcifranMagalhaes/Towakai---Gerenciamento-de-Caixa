class AddWeightToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :weight, :float
  end
end
