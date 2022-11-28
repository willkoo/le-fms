# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database"
CompanyProfile.destroy_all
Profile.destroy_all
Franchise.destroy_all
Profile.destroy_all
User.destroy_all
Franchise.destroy_all
Profile.destroy_all
CompanyProfile.destroy_all
Licence.destroy_all
Partner.destroy_all
Quiz.destroy_all
QuizQuestion.destroy_all
QuizAnswer.destroy_all
QuizAttempt.destroy_all

puts "Creating users..."
User.create(email: "admin@gmail.com", password: "password", admin: true)
User.create(email: "user1@gmail.com", password: "password")
User.create(email: "user2@gmail.com", password: "password")

puts "Creating franchises..."

Franchise.create(name: "Starbucks", user_id: "1", description: "It happens millions of times each week – a customer receives a drink from a Starbucks barista - but each interaction is unique.")

puts "Creating (user) profiles..."
Profile.create(user_id: "1", first_name: "Willie", last_name: "Khoo", contact_number: "91234567", description: "This is owner's account with one assigned franchise.", country: "Singapore")
Profile.create(user_id: "2", first_name: "Collin", last_name: "Chua", contact_number: "91234567", description: "This is an applicant account with one assigned company.", country: "Singapore")
Profile.create(user_id: "3", first_name: "Lester", last_name: "Wee", contact_number: "98892834", description: "This is the 2nd applicant account with 2 assigned companies.", country: "Singapore")

puts "Creating companies..."
CompanyProfile.create(name: "1north", uen: "200112345A", address: "1north towers", profile_id: "2", url: "www.1north.com", status: "verified", paid_up_capital: 100000, last_fy_revenue: 800000, legal_disputes: "No legal issues.")
CompanyProfile.create(name: "2sky", uen: "200122325B", address: "2sky towers", profile_id: "2", url: "www.2ky.com", status: "verified", paid_up_capital: 200000, last_fy_revenue: 700000, legal_disputes: "No legal issues.")
CompanyProfile.create(name: "2net", uen: "200122325B", address: "2net towers", profile_id: "3", url: "www.2net.com", status: "pending", paid_up_capital: 300000, last_fy_revenue: 600000, legal_disputes: "No legal issues.")

puts "Creating licenses..."
Licence.create(company_profile_id: "1", franchise_id: "1", proposed_location: "20 Collyer Quay", licence_status: "pending")
Licence.create(company_profile_id: "2", franchise_id: "1", proposed_location: "123 Clayton Street", licence_status: "pending")

puts "Creating quizzes..."
Quiz.create(quiz_name: "First_quiz", franchise_id: "1")

puts "Creating quiz 3 questions for first quiz..."
QuizQuestion.create(quiz_id: "1", question: "How to make good coffee?", correct_option: "With blood, sweat, tears and love. :)", wrong_option_one: "blah blah blah", wrong_option_two: "wrong lahhhhhh", wrong_option_three: "aiyoooooooo")
QuizQuestion.create(quiz_id: "1", question: "How to make good tea?", correct_option: "With tender loving care. :)", wrong_option_one: "blah blah blah", wrong_option_two: "wrong lahhhhhh", wrong_option_three: "aiyoooooooo")
QuizQuestion.create(quiz_id: "1", question: "How to make good sandwich?", correct_option: "Yum Yum. :)", wrong_option_one: "blah blah blah", wrong_option_two: "wrong lahhhhhh", wrong_option_three: "aiyoooooooo")

puts "Creating quiz attempts"
QuizAttempt.create(quiz_score: 0, quiz_status: "pending", partner_id: "1")

puts "Creating quiz answers"
QuizAnswer.create(quiz_question_id: "1", quiz_attempt_id: "1", answer: "blah blah blah")
QuizAnswer.create(quiz_question_id: "2", quiz_attempt_id: "1", answer: "wrong lahhhhhh")
QuizAnswer.create(quiz_question_id: "3", quiz_attempt_id: "1", answer: "Yum Yum. :)")

puts "Finish Seeding!"
