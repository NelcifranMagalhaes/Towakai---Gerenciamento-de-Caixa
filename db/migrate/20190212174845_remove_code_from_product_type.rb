# frozen_string_literal: true

class RemoveCodeFromProductType < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_types, :code, :string
  end
end
