# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Checklist.create!(title: "Laver les tables", description: "très rapidement")
Checklist.create!(title: "Faire la vaisselle", description: "ce soir")
Checklist.create!(title: "Faire la caisse", description: "demain")
Checklist.create!(title: "Faire la tondeuse", description: "now")

puts "#{Checklist.count}"

User.create! (first_name: "Hicham", last_name: "troplong", email: "hicham@email.com", phone_number: '092323233', role: "user")

puts "#{User.count}"
