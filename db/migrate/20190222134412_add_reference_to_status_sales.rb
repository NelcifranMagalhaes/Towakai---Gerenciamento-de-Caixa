# frozen_string_literal: true

class AddReferenceToStatusSales < ActiveRecord::Migration[5.2]
  def change
    add_column :status_sales, :reference, :integer
  end
end
