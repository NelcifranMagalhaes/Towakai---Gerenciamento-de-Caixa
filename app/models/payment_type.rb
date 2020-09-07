# frozen_string_literal: true

class PaymentType < ApplicationRecord
  validates :name, presence: true
end
