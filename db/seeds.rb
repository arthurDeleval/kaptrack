# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.destroy_all

puts 'Creating users...'
arthur = User.create!(first_name: "arthur", last_name: "Deleval", email: "arthur@gmail.com", phone_number: 0645353434, role: "manager", password: "azerty")
puts 'Finished!'

puts "creating recipes ..."
pizza = Recipe.create!(name: "Pizza 4 fromages", recipe_description:" 1- farine 2- 4 fromages 3-Mettre au four 4-Ajouter du basilic", price: 16, preparation_time: 20, specificity: "not spicy", meal_description: "Ricotta aux herbes, gorgonzola, parmigiano, mozza fior di latte, herbes fraîches", menu_visible: false, user_id: 6)
pattes = Recipe.create!(name: "CONCHIGLIE AL TARTUFO", recipe_description:" 1- créer les pates 2- faire bouillir l'eau  3-ajouter les ingrédients 4-Ajouter du basilic", price: 10, preparation_time: 16, specificity: "little spicy", meal_description: "Conchiglie gratinées au parmesan, truffe fraîche, crème de truffe noire, mascarpone, caciocavallo et petits champignons", menu_visible: false, user_id: 6)
puts 'Finished!'

Checklist.create!(title: "Laver les tables", description: "très rapidement")
Checklist.create!(title: "Faire la vaisselle", description: "ce soir")
Checklist.create!(title: "Faire la caisse", description: "demain")
Checklist.create!(title: "Faire la tondeuse", description: "now")

puts "#{Checklist.count}"
