class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
		t.belongs_to :sale, index: true
		t.belongs_to :product,index: true
		t.integer :quant
    end
  end
end
