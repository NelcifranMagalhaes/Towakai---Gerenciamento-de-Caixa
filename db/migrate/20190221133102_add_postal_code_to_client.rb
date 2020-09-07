# frozen_string_literal: true

class AddPostalCodeToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :postal_code, :string
  end
end
