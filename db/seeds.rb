# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "clearing Event:"
Event.destroy_all
puts " ✔"
print "clearing User:"
User.destroy_all
puts " ✔"
print "clearing Attendance:"
Attendance.destroy_all
puts " ✔"

print "Creating fake users:"
1.times do |user|
  User.create!(
    email:              Faker::Name.first_name.downcase + '@yopmail.com',
    encrypted_password: "0xLOL",
    description:        Faker::Lorem.sentence(5),
    first_name:         Faker::Name.first_name,
    last_name:          Faker::Name.last_name
  )
  end
puts " ✔"

print "Creating fake events:"
10.times do |event|
  Event.create!(
    start_date:         Faker::Date.forward(100),
    duration:           rand(1..10) * 5,
    title:              Faker::Lorem.sentence(3),
    description:        Faker::Lorem.sentence(10),
    price:              rand(1...1000),
    location:           Faker::Books::Dune.planet,
    administrator_id:   User.all.sample.id
  )
  end
puts " ✔"

# FYK : Base58 = Base64 - les caractères relous ("l, i, o, 0") et "+" "/"
print "Creating fake attendaces:"
42.times do |attendance|
  u = User.all.sample
  Attendance.create!(
    stripe_customer_id: Faker::Base58.encode(u.first_name),
    user_id:            u.id,
    event_id:           Event.all.sample.id
  )
end
puts " ✔"
