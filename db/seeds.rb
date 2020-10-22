# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
jean_eymard = { first_name: "Jean", id:1, last_name: "Eymard", email: "jean.eymard@gmail.com", password: "test123", address: "41 rue popincourt, 75011, Paris" }
anne_heantie =  { first_name: "Anne", id:2, last_name: "Héantie", email: "anne.heantie@gmail.com", password: "test321", address: "85 rue des Pyrénées, 75020, Paris" }
clement_bibolet = { first_name: "Clement", id:3, last_name: "Bibolet", email: "clement@test.com", password: "test321", address: "36 rue Chaptal, 92300, Levallois-Perret" }

[ jean_eymard, anne_heantie, clement_bibolet ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating plants..."
bonsai_ficus = { user: User.all.sample, name: "Joli petit bonsaï ficus", description: "Faites de votre petit salon Parisien une véritable jungle !", price_per_day: 2 }
crassula =  { user: User.all.sample, name: "Crassula, l'increvable", description: "Toujours verte avec peu d'entretien, elle est adaptée à ceux qui n'ont pas la main verte !", price_per_day: 3 }
pachira = { user: User.all.sample, name: "Pachira aquatica, plus qu'un voyage...", description: "Une plante qui invite au voyage... Attention, si ses feuilles vous rappellent des voyages 'spirituels' elles ne sont pourtant pas comestibles...", price_per_day: 3 }

images = ['https://images.unsplash.com/photo-1526397751294-331021109fbd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80', 'https://images.unsplash.com/photo-1511971532930-9d589f9e3a82?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1648&q=80', 'https://images.unsplash.com/photo-1511406818640-48d788a5c870?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1063&q=80']
[ bonsai_ficus, crassula, pachira ].each do |attributes|
  file = URI.open(images.sample)
  plant = Plant.new(attributes)
  plant.photo.attach(io: file, filename: 'plant.png', content_type: 'image/png')
  plant.save!
  puts "Created #{plant.name}"
end
puts "Finished!"

puts "Creating bookings..."
Booking.create!( user: User.find_by(first_name: "Clement"), plant: Plant.all.sample, start_date: "2020/10/10/", end_date: "2020/10/22" )
Booking.create!( user: User.find_by(first_name: "Clement"), plant: Plant.all.sample, start_date: "2020/09/02", end_date: "2020/09/08" )
puts "Finished!"







