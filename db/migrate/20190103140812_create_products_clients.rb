class CreateProductsClients < ActiveRecord::Migration[5.2]
  def change
    create_table :products_clients do |t|
    	t.date :date_sale
		t.belongs_to :client, index: true
	    t.belongs_to :product, index: true
	    t.timestamps
    end
  end
end
