# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
jean_eymard = { first_name: "Jean"last_name: "Eymard" email: "jean.eymard@gmail.com" address: "41 rue popincourt, 75011, Paris" }
anne_héantie =  { first_name: "Anne" last_name: "Héantie" email: "anne.héantie@gmail.com" address: "85 rue des Pyrénées, 75020, Paris" }

[ jean_eymard, anne_héantie ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"
end

puts "Creating plants..."
bonsai_ficus = { user_id: 1 name: "Joli petit bonsaï ficus", description: "Faites de votre petit salon Parisien une véritable jungle !", price_per_day: 2 }
crassula =  { user_id: 2 name: "Crassula, l'increvable", description: "Toujours verte avec peu d'entretien, elle est adaptée à ceux qui n'ont pas la main verte !", price_per_day: 3 }
pachira = { user_id: 2 name: "Pachira aquatica, plus qu'un voyage...", description: "Une plante qui invite au voyage... Attention, si ses feuilles vous rappellent des voyages 'spirituels' elles ne sont pourtant pas comestibles...", price_per_day: 3 }


[ bonsai_ficus, crassula, pachira ].each do |attributes|
  plant = Plant.create!(attributes)
  puts "Created #{plant.name}"
end
puts "Finished!"

