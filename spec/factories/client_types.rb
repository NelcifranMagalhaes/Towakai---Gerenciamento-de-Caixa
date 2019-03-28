FactoryBot.define do
  factory :client_type do
    name { ["Loja","Aluno", "Professor"].sample }
    tax_discount { Faker::Number.decimal(2) }
  end
end
