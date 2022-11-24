# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database"
Franchise.destroy_all
User.destroy_all

puts "Creating franchises"

Franchise.create(name: Faker::Restaurant.name)

puts "Creating users"

User.create(email: "admin@gmail.com", password: "password", admin: true)

User.create(email: "user1@gmail.com", password: "password")

User.create(email: "user2@gmail.com", password: "password")

puts "Finish Seeding!"
