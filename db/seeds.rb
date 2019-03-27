

puts "Deletando Clientes"
Client.destroy_all
puts "Deletando Produtos"
Product.destroy_all
# Role.destroy_all
# puts "Deletando Roles"
puts "Deletando Vendas"
Sale.destroy_all
puts "Deletando Orders"
Order.destroy_all
puts "Deletando Status Sales"
StatusSale.destroy_all
puts "Deletando Client type"
ClientType.destroy_all

puts "Criando status de venda"
StatusSale.create!(name: "Encomenda",description: "Venda entregue ao cliente",reference: 0)
StatusSale.create!(name: "Cadastrada",description: "Venda cadastrada",reference: 1)
StatusSale.create!(name: "Enviada",description: "Venda enviada para o cliente",reference: 2)
StatusSale.create!(name: "Recebida",description: "Venda entregue ao cliente",reference: 3)

puts "Criando status de cliente"
ClientType.create!(name: "Professor",tax_discount: 20.22)
ClientType.create!(name: "Aluno",tax_discount: 10.8)

client_type = ClientType.find(ClientType.pluck(:id))
puts "Criando Clientes"
30.times do |index|
	Client.create!(name: Faker::Name.name,address: Faker::Address.full_address,email: Faker::Internet.email,
		phone: Faker::PhoneNumber.cell_phone,client_type_id: client_type.shuffle.first.id,postal_code: 65634478)
end

product_type = ProductType.find(ProductType.pluck(:id))
puts "Criando Produtos"
100.times do |index|
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
status_sale = StatusSale.find(StatusSale.pluck(:id))
puts "criando vendas"
50.times do |index|
	Sale.create!(client_id: client.shuffle.first.id,sale_date: Faker::Date.between(1.year.ago, Date.today),user_id: user.shuffle.first.id,status_sale_id: status_sale.shuffle.first.id)
end
sale = Sale.find(Sale.pluck(:id))
puts "criando Orders"
50.times do |index|
	Order.create!(sale_id: sale.shuffle.first.id,product_id: product.shuffle.first.id,quant: Faker::Number.between(1, 10),price_saled: Faker::Number.between(30, 500))
end
