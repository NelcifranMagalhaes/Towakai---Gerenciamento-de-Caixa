
User.destroy_all
puts "Deletando Usuários"
Client.destroy_all
puts "Deletando Clientes"
Product.destroy_all
puts "Deletando Produtos"
Role.destroy_all
puts "Deletando Roles"
Sale.destroy_all
puts "Deletando Vendas"
Order.destroy_all
puts "Deletando Orders"

puts "Criando Clientes"
30.times do |index|
	Client.create!(name: Faker::Name.name,address: Faker::Address.full_address)
end
puts "Criando Produtos"
30.times do |index|
	Product.create!(name: Faker::Commerce.product_name,
		cost_price: Faker::Number.between(1, 100),tax: Faker::Number.between(1, 100),
		sale_price: Faker::Number.between(100, 1000),quantity: Faker::Number.between(1, 100))
end

puts "Criados Roles"
Role.create!(name: 'admin')
Role.create!(name: 'visitante')
Role.create!(name: 'funcionario')


