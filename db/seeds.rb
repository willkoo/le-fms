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

puts "Creating franchises..."

Franchise.create(name: "Starbucks", user_id: "1", description: "It happens millions of times each week – a customer receives a drink from a Starbucks barista - but each interaction is unique.", url: "www.starbucks.com.sg")

puts "Creating users..."

User.create(email: "admin@gmail.com", password: "password", admin: true)

User.create(email: "user1@gmail.com", password: "password")

User.create(email: "user2@gmail.com", password: "password")

put "Creating (user) profiles..."

Profile.create(user_id: "2", first_name: "User1", last_name: "Tester1", contact_number: "91234567", description: "This is a tester account 1 with a company assigned", country: "Singapore")

Profile.create(user_id: "3", first_name: "User2", last_name: "Tester2", contact_number: "98892834", description: "This is another tester account 2 with 2 companies assigned", country: "Singapore")

puts "Creating companies..."

CompanyProfile.create(name: "1north", uen: "200112345A", address: "1north towers", profile_id: "1", website: "www.1north.com", verified: "false")

CompanyProfile.create(name: "2sky", uen: "200122325B", address: "2sky towers", profile_id: "2", website: "www.2ky.com", verified: "false")

CompanyProfile.create(name: "2net", uen: "200122325B", address: "2net towers", profile_id: "2", website: "www.2net.com", verified: "true")

puts "Creating company records"

CompanyRecord.create(company_profile_id: "1", paid_up_capital: "$150000", last_fy_revenue: "3200558", legal_disputes: "no")

CompanyRecord.create(company_profile_id: "2", paid_up_capital: "$200000", last_fy_revenue: "5120210", legal_disputes: "no")

CompanyRecord.create(company_profile_id: "2", paid_up_capital: "$120000", last_fy_revenue: "2420229", legal_disputes: "no")

puts "Finish Seeding!"
