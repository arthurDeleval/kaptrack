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
CustomerConsumption.destroy_all
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
burger = Recipe.create(name: "burger", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 20, cost: 10, meal_description: "burger",preparation_time: 10, user_id: arthur.id)
fajitas = Recipe.create(name: "fajitas", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 10, cost: 5, meal_description: "old el paso",preparation_time: 15, user_id: arthur.id)
maccheese = Recipe.create(name: "mac&cheese", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 12, cost: 6, meal_description: "cheese",preparation_time: 8, user_id: arthur.id)
salad = Recipe.create(name: "Salad", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 8, cost: 3, meal_description: "fresh & lite",preparation_time: 5, user_id: arthur.id)
pizza = Recipe.create(name: "Pizza", recipe_description:"Tranchez de fines lamelles d'emmental afin de recouvrir la partie inférieure de votre pain à burger. Mettez ensuite au four sur le mode grill le temps de faire fondre le fromage.", price: 16, cost: 4, meal_description: "delicioso",preparation_time: 16, user_id: arthur.id)
puts "recipes created"

puts 'Creating checklists...'
Checklist.create!(title: "Laver les tables", description: "très rapidement")
Checklist.create!(title: "Faire la vaisselle", description: "ce soir")
Checklist.create!(title: "Faire la caisse", description: "demain")
Checklist.create!(title: "Faire la tondeuse", description: "now")
puts "#{Checklist.count} created"

puts 'Creating performances...'
monday = Performance.create(customer_number: 35, date: "12/09/2020", server_number: 4)
tuesday = Performance.create(customer_number: 55, date: "12/08/2020", server_number: 6)
wednesday = Performance.create(customer_number: 27, date: "12/07/2020", server_number: 3)
thursday = Performance.create(customer_number: 80, date: "12/06/2020", server_number: 8)
friday = Performance.create(customer_number: 25, date: "12/05/2020", server_number: 3)
saturd = Performance.create(customer_number: 72, date: "12/04/2020", server_number: 7)
sunday = Performance.create(customer_number: 97, date: "12/03/2020", server_number: 10)
puts "performances created"

puts 'Creating customer cons...'
CustomerConsumption.create(quantity: 3, recipe: burger, performance: monday)
CustomerConsumption.create(quantity: 7, recipe: fajitas, performance: monday)
CustomerConsumption.create(quantity: 5, recipe: salad, performance: monday)
CustomerConsumption.create(quantity: 1, recipe: maccheese, performance: monday)
CustomerConsumption.create(quantity: 2, recipe: pizza, performance: monday)
CustomerConsumption.create(quantity: 10, recipe: fajitas, performance: tuesday)
CustomerConsumption.create(quantity: 7, recipe: pizza, performance: tuesday)
CustomerConsumption.create(quantity: 5, recipe: salad, performance: tuesday)
CustomerConsumption.create(quantity: 3, recipe: burger, performance: tuesday)
CustomerConsumption.create(quantity: 2, recipe: maccheese, performance: tuesday)
CustomerConsumption.create(quantity: 10, recipe: maccheese, performance: wednesday)
CustomerConsumption.create(quantity: 9, recipe: salad, performance: wednesday)
CustomerConsumption.create(quantity: 2, recipe: pizza, performance: wednesday)
CustomerConsumption.create(quantity: 1, recipe: burger, performance: wednesday)
CustomerConsumption.create(quantity: 9, recipe: fajitas, performance: wednesday)
CustomerConsumption.create(quantity: 2, recipe: pizza, performance: thursday)
CustomerConsumption.create(quantity: 12, recipe: burger, performance: thursday)
CustomerConsumption.create(quantity: 3, recipe: salad, performance: thursday)
CustomerConsumption.create(quantity: 10, recipe: fajitas, performance: thursday)
CustomerConsumption.create(quantity: 13, recipe: maccheese, performance: thursday)
CustomerConsumption.create(quantity: 7, recipe: pizza, performance: friday)
CustomerConsumption.create(quantity: 5, recipe: maccheese, performance: friday)
CustomerConsumption.create(quantity: 4, recipe: salad, performance: friday)
CustomerConsumption.create(quantity: 20, recipe: fajitas, performance: friday)
CustomerConsumption.create(quantity: 30, recipe: burger, performance: friday)
CustomerConsumption.create(quantity: 23, recipe: maccheese, performance: saturd)
CustomerConsumption.create(quantity: 34, recipe: pizza, performance: saturd)
CustomerConsumption.create(quantity: 9, recipe: salad, performance: saturd)
CustomerConsumption.create(quantity: 7, recipe: fajitas, performance: saturd)
CustomerConsumption.create(quantity: 12, recipe: burger, performance: saturd)
CustomerConsumption.create(quantity: 4, recipe: burger, performance: sunday)
CustomerConsumption.create(quantity: 2, recipe: pizza, performance: sunday)
CustomerConsumption.create(quantity: 2, recipe: salad, performance: sunday)
CustomerConsumption.create(quantity: 4, recipe: fajitas, performance: sunday)
CustomerConsumption.create(quantity: 2, recipe: maccheese, performance: sunday)
puts "customer cons created"