# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users

require "faker"

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: Faker::Internet.password
  )
end

5.times do
  Zone.create(
    name: Faker::DcComics.hero
  )
end

10.times do
  NurseryTable.create(
    capacity: Faker::Number.between(1, 200),
    name: Faker::DcComics.title,
    zone_id: Faker::Number.between(1, 5)
  )
end

15.times { Dive.create }

20.times do
  RestorationActivityLogEntry.create(
    cleaned: Faker::Boolean.boolean(0.8),
    percent_filled: Faker::Number.between(0, 100),
    bleached_corals: Faker::Number.between(0, 40),
    dead_corals: Faker::Number.between(0, 40),
    dive_id: Faker::Number.between(1, 15),
    nursery_table_id: Faker::Number.between(1, 10)
  )
end
