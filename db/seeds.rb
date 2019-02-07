

# Client.destroy_all
# puts "Deletando Clientes"
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
product_type = ProductType.find(ProductType.pluck(:id))
puts "Criando Produtos"
30.times do |index|
	Product.create!(name: Faker::Commerce.product_name,
		cost_price: Faker::Number.between(15, 100),low_quantity: Faker::Number.between(1, 10),product_type_id: product_type.shuffle.first.id,
		sale_price: Faker::Number.between(30, 1000),quantity: Faker::Number.between(15, 100))
end

# puts "Criados Roles"
# Role.create!(name: 'admin')
# Role.create!(name: 'visitante')
# Role.create!(name: 'funcionario')
user = User.find(User.pluck(:id))
client = Client.find(Client.pluck(:id))
product = Product.find(Product.pluck(:id))
puts "criando vendas"
30.times do |index|
	Sale.create!(client_id: client.shuffle.first.id,sale_date: Faker::Date.between(1.year.ago, Date.today),user_id: user.shuffle.first.id)
end
sale = Sale.find(Sale.pluck(:id))
puts "criando Orders"
30.times do |index|
	Order.create!(sale_id: sale.shuffle.first.id,product_id: product.shuffle.first.id,quant: Faker::Number.between(1, 10))
end
