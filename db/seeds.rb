# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lot.destroy_all
Product.destroy_all
User.destroy_all
Recipe.destroy_all
Performance.destroy_all
Customer_consumption.destroy_all
Supplier.destroy_all

require 'faker'

puts 'Creating suppliers ...'
100.times do
  supplier = Supplier.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    delivery_estimation: "#{[2..10].sample} days"
  )
  supplier.save!
end
puts 'suppliers Finished!'


puts 'Creating products ...'

100.times do
  product = Product.new(
    name:    Faker::Food.ingredient,
    measure_unit: Faker::Food.measurement,
  )
  product.save!
end

puts 'products Finished!'

puts 'Creating users...'
arthur = User.create!(first_name: "arthur", last_name: "Deleval", email: "arthur@gmail.com", phone_number: 0645353434, role: "manager", password: "azerty")
puts 'Finished!'

puts 'Creating recipes...'
Recipe.create(name: "burger", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 20, cost: 10, meal_description: "burger",preparation_time: 10, user_id: arthur.id)
Recipe.create(name: "fajitas", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 10, cost: 5, meal_description: "old el paso",preparation_time: 15, user_id: arthur.id)
Recipe.create(name: "mac&cheese", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 12, cost: 6, meal_description: "cheese",preparation_time: 8, user_id: arthur.id)
Recipe.create(name: "Salad", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 8, cost: 3, meal_description: "fresh & lite",preparation_time: 5, user_id: arthur.id)
Recipe.create(name: "Pizza", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 16, cost: 4, meal_description: "delicioso",preparation_time: 16, user_id: arthur.id)
puts "recipes created"

puts 'Creating checklists...'
Checklist.create!(title: "Laver les tables", description: "très rapidement")
Checklist.create!(title: "Faire la vaisselle", description: "ce soir")
Checklist.create!(title: "Faire la caisse", description: "demain")
Checklist.create!(title: "Faire la tondeuse", description: "now")
puts "#{Checklist.count} created"

puts 'Creating performances...'
Performance.create(customer_number: 35, date: "12/09/2020", server_number: 4)
Performance.create(customer_number: 55, date: "12/08/2020", server_number: 6)
Performance.create(customer_number: 27, date: "12/07/2020", server_number: 3)
Performance.create(customer_number: 80, date: "12/06/2020", server_number: 8)
Performance.create(customer_number: 25, date: "12/05/2020", server_number: 3)
Performance.create(customer_number: 72, date: "12/04/2020", server_number: 7)
Performance.create(customer_number: 97, date: "12/03/2020", server_number: 10)
puts "performances created"

puts 'Creating customer cons...'
Customer_consumption.create(quantity: 30, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 54, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 25, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 80, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 23, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 70, recipe_id: recipe.id, performance_id: performance.id)
Customer_consumption.create(quantity: 95, recipe_id: recipe.id, performance_id: performance.id)
puts "customer cons created"