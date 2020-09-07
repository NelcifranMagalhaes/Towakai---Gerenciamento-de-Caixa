# frozen_string_literal: true

class CreatePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
