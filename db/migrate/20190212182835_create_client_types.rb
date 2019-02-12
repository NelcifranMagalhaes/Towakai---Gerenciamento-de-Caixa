class CreateClientTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :client_types do |t|
      t.string :name
      t.float :tax_discount

      t.timestamps
    end
  end
end
