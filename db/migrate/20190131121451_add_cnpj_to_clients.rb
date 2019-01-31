class AddCnpjToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :cnpj, :string
  end
end
