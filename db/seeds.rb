# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supplier.destroy_all
Product.destroy_all
Lot.destroy_all



require 'faker'

puts 'Creating fake data ...'
10.times do
  supplier = Supplier.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    delivery_estimation: "#{[2..10].sample} days"
  )
  supplier.save!
end

10.times do
  product = Product.new(
    name:    Faker::Food.ingredient,
    measure_unit: Faker::Food.measurement,
  )
  product.save!
end

puts 'Finished!'
