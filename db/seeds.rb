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
Plant.destroy_all
Booking.destroy_all


puts "Creating users..."

file = URI.open('https://avatars3.githubusercontent.com/u/46726561?s=60&u=0220bde2b8e3e990aabc64041748d16b4e3c5777&v=4')
caroline = User.new(
first_name: "Caroline",
last_name: "Karpiel",
email: "caroline@test.com",
password: "test321",
address: "41 rue popincourt, 75011, Paris",
)
caroline.photo.attach(io: file, filename: 'caroline.png', content_type: 'image/png')
caroline.save!

file = URI.open('https://avatars0.githubusercontent.com/u/65772685?s=460&u=19842663fa4b75c28caf632b120957e3dfdb2f97&v=4')
camille = User.new(
first_name: "Camille",
last_name: "Subtil",
email: "camille@test.com",
password: "test321",
address: "2 villa Gaudelet, 75011, Paris",
)
camille.photo.attach(io: file, filename: 'camille.png', content_type: 'image/png')
camille.save!

file = URI.open('https://avatars3.githubusercontent.com/u/63556423?s=460&u=fd79c26bca3aead73759c01c5f950bedb9e9b3a8&v=4')
clement = User.new(
first_name: "Clement",
last_name: "Bibolet",
email: "clement@test.com",
password: "test321",
address: "36 rue chaptal, 92300, Levallois-Perret",
)
clement.photo.attach(io: file, filename: 'clement.png', content_type: 'image/png')
clement.save!

file = URI.open('https://avatars3.githubusercontent.com/u/25386941?s=460&u=84af91df946b5ebcf29aa45a2536f845831da56d&v=4')
arnaud = User.new(
first_name: "Arnaud",
last_name: "Wagon",
email: "arnaud@test.com",
password: "test321",
address: "2 Rue Duranti, 75011, Paris",
)
arnaud.photo.attach(io: file, filename: 'arnaud.png', content_type: 'image/png')
arnaud.save!

puts "Finished users!"

puts "Creating plants..."

file = URI.open('https://images.unsplash.com/photo-1571229721124-b883163bd33c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80')
nerium = Plant.new(
name: "Nerium Oleander Villa Romaine",
description: "Profitez de sa fleur simple, rose clair à gorge rose vif et ses feuilles sont persistantes vert sombre et coriaces.",
price_per_day: 5,
user: clement
)
nerium.photo.attach(io: file, filename: 'nerium.png', content_type: 'image/png')
nerium.save!

file = URI.open('https://images.unsplash.com/photo-1592592962756-696ffbf5d6fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2775&q=80')
phalaenopsis = Plant.new(
name: "Phalaenopsis Multiflora",
description: "La palette des coloris est très riche, du blanc pur à toutes les nuances de rose, ainsi que le mauve, l'orangé et le jaune.",
price_per_day: 4,
user: caroline
)
phalaenopsis.photo.attach(io: file, filename: 'phalaenopsis.png', content_type: 'image/png')
phalaenopsis.save!

file = URI.open('https://images.unsplash.com/photo-1523820084935-cfd4aecd5b02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80')
hydra = Plant.new(
name: "Hydrangea panniculata 'Silver Dollar'",
description: "Les fleurs vertes au départ devenant blanches et vertes prennent une jolie couleur rose cramoisi en automne.",
price_per_day: 6,
user: camille
)
hydra.photo.attach(io: file, filename: 'hydra.png', content_type: 'image/png')
hydra.save!

file = URI.open('https://images.unsplash.com/photo-1597451407304-840ff7a12864?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1659&q=80')
ficus = Plant.new(
name: "Joli petit bonsaï ficus",
description: "Faites de votre petit salon Parisien une véritable jungle ! Les fleurs vertes au départ devenant blanches et vertes prennent une jolie couleur rose cramoisi en automne.",
price_per_day: 4,
user: arnaud
)
ficus.photo.attach(io: file, filename: 'ficus.png', content_type: 'image/png')
ficus.save!

file = URI.open('https://images.unsplash.com/photo-1597211684565-dca64d72bdfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=788&q=80')
crassu = Plant.new(
name: "Crassula, l'increvable",
description: "Faites de votre petit salon Parisien une véritable jungle ! Cette plante n'est pas rustique. Elle demande une température minimum de +5°C. À hiverner au sec ( de 5°C à 15°C) Cultivez en pot cette plante succulente, au charme certain, avec son feuillage épais, vert ou gris-vert et sa belle floraison. Sortez-la, à l'extérieur, au soleil avec un léger ombrage, en été.",
price_per_day: 5,
user: clement
)
crassu.photo.attach(io: file, filename: 'crassu.png', content_type: 'image/png')
crassu.save!

file = URI.open('https://images.unsplash.com/photo-1585919502021-960a93e258d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80')
pachira = Plant.new(
name: "Pachira aquatica, plus qu'un voyage...",
description: "Une plante qui invite au voyage... Attention, si ses feuilles vous rappellent des voyages 'spirituels' elles ne sont pourtant pas comestibles... Cette plante n'est pas rustique. Elle demande une température minimum de +5°C. À hiverner au sec ( de 5°C à 15°C) Cultivez en pot cette plante succulente, au charme certain, avec son feuillage épais, vert ou gris-vert et sa belle floraison. Sortez-la, à l'extérieur, au soleil avec un léger ombrage, en été.",
price_per_day: 4,
user: clement
)
pachira.photo.attach(io: file, filename: 'pachira.png', content_type: 'image/png')
pachira.save!

puts "Finished plants!"

puts "Creating bookings..."
Booking.create!( user: clement, plant: ficus, start_date: "2020/10/10/", end_date: "2020/10/22" )
Booking.create!( user: clement, plant: hydra, start_date: "2020/09/02", end_date: "2020/09/08" )
Booking.create!( user: clement, plant: phalaenopsis, start_date: "2019/09/02", end_date: "2019/09/25" )
Booking.create!( user: clement, plant: hydra, start_date: "2018/08/02", end_date: "2020/08/08" )
puts "Finished!"








