# frozen_string_literal: true

class StatusSale < ApplicationRecord
  validates :name, presence: true

  def name_upper
    name.upcase.to_s
  end
end
