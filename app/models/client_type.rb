# frozen_string_literal: true

class ClientType < ApplicationRecord
  validates :name, presence: true

  def name_to_upcase
    name.upcase.to_s
  end
end
