
I18n.locale = 'pt-BR'
puts 'Deletando Clientes'
Client.destroy_all
puts 'Deletando Produtos'
Product.destroy_all
Role.destroy_all
puts 'Deletando Roles'
puts 'Deletando Vendas'
Sale.destroy_all
puts 'Deletando Orders'
Order.destroy_all
puts 'Deletando Status Sales'
StatusSale.destroy_all
puts 'Deletando Client type'
ClientType.destroy_all
puts 'Deletando usuários'
User.destroy_all

puts 'Criando status de venda'
StatusSale.create!(name: 'Em andamento', description: 'Venda entregue ao cliente', reference: 0)
StatusSale.create!(name: 'Confirmação', description: 'Venda cadastrada', reference: 1)
StatusSale.create!(name: 'Enviada', description: 'Venda enviada para o cliente', reference: 2)
StatusSale.create!(name: 'Finalizado', description: 'Venda entregue ao cliente', reference: 3)

puts 'Criando status de cliente'
ClientType.create!(name: 'Professor', tax_discount: 20.22)
ClientType.create!(name: 'Aluno', tax_discount: 10.8)

client_type = ClientType.find(ClientType.pluck(:id))

puts 'Criando Clientes'
30.times do |_index|
  Client.create!(name: Faker::Name.name, address: Faker::Address.full_address, email: Faker::Internet.email,
                 phone: Faker::PhoneNumber.cell_phone, client_type_id: client_type.sample.id, postal_code: 65_634_478)
end

puts 'Criando Especificações de Produtos'
ProductSpecification.create!(name: 'Copos', description: 'Apenas copos')
ProductSpecification.create!(name: 'Pratos', description: 'Apenas pratos')
ProductSpecification.create!(name: 'Colheres', description: 'Apenas Colheres')
product_specification = ProductSpecification.find(ProductSpecification.pluck(:id))

puts 'Criando Tipo de Produtos'
ProductType.create!(name: 'Tipo 1', color: 'Vermelho', size: 'M', product_specification_id: product_specification.sample.id)
ProductType.create!(name: 'Tipo 2', color: 'Azul', size: 'XG', product_specification_id: product_specification.sample.id)

product_type = ProductType.find(ProductType.pluck(:id))
puts 'Criando Produtos'
30.times do |_index|
  Product.create!(name: Faker::Commerce.product_name,
                  cost_price: Faker::Number.between(from: 15, to: 100), low_quantity: Faker::Number.between(from: 1, to: 10), product_type_id: product_type.sample.id,
                  sale_price: Faker::Number.between(from: 30, to: 1000), quantity: Faker::Number.between(from: 15, to: 100))
end

puts 'Criados Roles'
Role.create!(name: 'admin')
Role.create!(name: 'visitante')
Role.create!(name: 'funcionario')

puts 'Criando Usuários'
User.create!(email: 'admin@gmail.com', password: '123456', password_confirmation: '123456')
User.create!(email: 'func@gmail.com', password: '123456', password_confirmation: '123456')
User.create!(email: 'visit@gmail.com', password: '123456', password_confirmation: '123456')

puts 'Criando Roles para usuários'
User.find_by(email: 'admin@gmail.com').add_role(:admin)
User.find_by(email: 'func@gmail.com').add_role(:funcionario)

puts 'Criando Tipo de Pagamentos'
PaymentType.create!(name: 'Depósito', description: 'Depósito em conta')
PaymentType.create!(name: 'Cartão', description: 'Pagamento com cartão')
PaymentType.create!(name: 'Em mãos', description: 'Pagamento em mãos')
PaymentType.create!(name: 'Boleto', description: 'Pagamento com Boleto')

user = User.find(User.pluck(:id))
client = Client.find(Client.pluck(:id))
product = Product.find(Product.pluck(:id))
status_sale = StatusSale.find(StatusSale.pluck(:id))
payment = PaymentType.find(PaymentType.pluck(:id))

puts 'criando vendas'
10.times do |_index|
  Sale.create!(client_id: client.sample.id, sale_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
               user_id: user.sample.id, status_sale_id: status_sale.sample.id, payment_type_id: payment.sample.id)
end
sale = Sale.find(Sale.pluck(:id))
puts 'criando Orders'
50.times do |_index|
  Order.create!(sale_id: sale.sample.id, product_id: product.sample.id, quant: Faker::Number.between(from: 1, to: 10), price_saled: Faker::Number.between(from: 30, to: 500))
end
