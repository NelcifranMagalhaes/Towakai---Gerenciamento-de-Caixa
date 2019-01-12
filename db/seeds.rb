
Client.destroy_all
Product.destroy_all

30.times do |index|
	Client.create!(name: Faker::OnePiece.character,address: Faker::OnePiece.location)
end

# 30.times do |index|
# 	Product.create!(name: Faker::Commerce.product_name,cost_price: Faker::Number.decimal(2),tax: Faker::Number.decimal(2),sale_price: Faker::Number.decimal(2),quantity: Faker::Number.between(1, 100))
# end