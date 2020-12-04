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
User.destroy_all
Recipe.destroy_all

require 'faker'

puts 'Creating fake data ...'
100.times do
  supplier = Supplier.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    delivery_estimation: "#{[2..10].sample} days"
  )
  supplier.save!
end

100.times do
  product = Product.new(
    name:    Faker::Food.ingredient,
    measure_unit: Faker::Food.measurement,
  )
  product.save!
end

puts 'Finished!'


puts 'Creating users...'
arthur = User.create!(first_name: "arthur", last_name: "Deleval", email: "arthur@gmail.com", phone_number: 0645353434, role: "manager", password: "azerty")
puts 'Finished!'

Checklist.create!(title: "Laver les tables", description: "très rapidement")
Checklist.create!(title: "Faire la vaisselle", description: "ce soir")
Checklist.create!(title: "Faire la caisse", description: "demain")
Checklist.create!(title: "Faire la tondeuse", description: "now")

puts "#{Checklist.count}"
