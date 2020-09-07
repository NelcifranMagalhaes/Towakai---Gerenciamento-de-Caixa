# frozen_string_literal: true

class ProductSpecification < ApplicationRecord
  validates :name, presence: true
end
