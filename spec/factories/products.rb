# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    value { 1.5 }
    cost_price { 1.5 }
    tax { 1.5 }
    sale_price { 1.5 }
    name { 'MyString' }
  end
end
