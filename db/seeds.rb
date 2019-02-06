

Client.destroy_all
puts "Deletando Clientes"
Product.destroy_all
puts "Deletando Produtos"
# Role.destroy_all
# puts "Deletando Roles"
Sale.destroy_all
puts "Deletando Vendas"
Order.destroy_all
puts "Deletando Orders"

# puts "Criando Clientes"
# 30.times do |index|
# 	Client.create!(name: Faker::Name.name,address: Faker::Address.full_address,email: Faker::Internet.email,phone: Faker::PhoneNumber.cell_phone,)
# end
# puts "Criando Produtos"
# 30.times do |index|
# 	Product.create!(name: Faker::Commerce.product_name,
# 		cost_price: Faker::Number.between(1, 100),low_quantity: Faker::Number.between(1, 10),
# 		sale_price: Faker::Number.between(100, 1000),quantity: Faker::Number.between(1, 100))
# end

# puts "Criados Roles"
# Role.create!(name: 'admin')
# Role.create!(name: 'visitante')
# Role.create!(name: 'funcionario')


