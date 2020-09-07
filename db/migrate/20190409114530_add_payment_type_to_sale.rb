# frozen_string_literal: true

class AddPaymentTypeToSale < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :payment_type, foreign_key: true
  end
end
