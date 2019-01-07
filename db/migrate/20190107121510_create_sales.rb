class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
    	t.belongs_to :client, index: true
    	t.date :sale_date
      	t.timestamps
    end
  end
end
