# frozen_string_literal: true

class AddUfToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :uf, :string
  end
end
