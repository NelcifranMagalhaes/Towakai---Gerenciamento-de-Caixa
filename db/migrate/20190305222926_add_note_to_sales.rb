class AddNoteToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :note, :text
  end
end
