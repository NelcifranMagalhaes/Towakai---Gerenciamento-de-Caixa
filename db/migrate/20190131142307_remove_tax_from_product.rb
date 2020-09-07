# frozen_string_literal: true

class RemoveTaxFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :tax_cents, :float
    remove_column :products, :tax_currency, :string
  end
end
