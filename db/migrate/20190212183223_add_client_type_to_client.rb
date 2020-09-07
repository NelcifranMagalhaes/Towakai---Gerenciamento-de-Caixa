# frozen_string_literal: true

class AddClientTypeToClient < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :client_type, foreign_key: true
  end
end
