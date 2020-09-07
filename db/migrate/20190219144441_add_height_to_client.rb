# frozen_string_literal: true

class AddHeightToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :height, :float
  end
end
