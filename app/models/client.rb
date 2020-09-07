# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :sales
  belongs_to :client_type
  validates :name, presence: true
  validates :address, presence: true
  # validates :email,presence: true
  validates :postal_code, presence: true

  def name_with_type
    "#{name.upcase} - #{client_type.name}"
  end

  def name_to_upcase
    name.upcase.to_s
  end
end
