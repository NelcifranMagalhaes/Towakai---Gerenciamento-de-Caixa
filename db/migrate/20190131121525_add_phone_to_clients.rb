class AddPhoneToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :phone, :string
  end
end
