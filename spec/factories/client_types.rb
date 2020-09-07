# frozen_string_literal: true

FactoryBot.define do
  factory :client_type do
    name { %w[Loja Aluno Professor].sample }
    tax_discount { Faker::Number.decimal(l_digits: 2) }
  end
end
