
Client.destroy_all
puts "Deletando Clientes"
Product.destroy_all
puts "Deletando Produtos"

Sale.destroy_all
puts "Deletando Vendas"

Order.destroy_all
puts "Deletando Orders"

puts "Criados Clientes"
30.times do |index|
	Client.create!(name: Faker::Name.name,address: Faker::Address.full_address)
end
puts "Criados Produtos"
30.times do |index|
	Product.create!(name: Faker::Commerce.product_name,
		cost_price: Faker::Number.between(1, 100),tax: Faker::Number.between(1, 100),
		sale_price: Faker::Number.between(100, 1000),quantity: Faker::Number.between(1, 100))
end

