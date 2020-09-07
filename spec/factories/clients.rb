# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::JapaneseMedia::OnePiece.character }
    address { Faker::JapaneseMedia::OnePiece.location }
    postal_code { Faker::Address.postcode }
    client_type
  end
end
