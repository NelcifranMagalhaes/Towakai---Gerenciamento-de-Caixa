# frozen_string_literal: true

class AddTrackToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :track, :string
  end
end
