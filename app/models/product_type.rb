# frozen_string_literal: true

class ProductType < ApplicationRecord
  validates :name, presence: true
  validates :size, presence: true
  validates :color, presence: true
  belongs_to :product_specification

  validates :product_specification, presence: true

  def name_code_of_product
    name.upcase.to_s
  end
end
