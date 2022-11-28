# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database"
CompanyProfile.destroy_all
Franchise.destroy_all
Profile.destroy_all
User.destroy_all
Licence.destroy_all
Quiz.destroy_all
QuizQuestion.destroy_all
QuizAnswer.destroy_all
QuizAttempt.destroy_all
QuizOption.destroy_all

puts "Creating users..."
User.create(email: "admin@gmail.com", password: "password", admin: true)
User.create(email: "user1@gmail.com", password: "password")
User.create(email: "user2@gmail.com", password: "password")

puts "Creating franchises..."

Franchise.create(name: "Starbucks", user_id: "1", description: "It happens millions of times each week – a customer receives a drink from a Starbucks barista - but each interaction is unique.")
Franchise.create(name: "KFC", user_id: "2", description: "Finger Lickin Good.")

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
Quiz.create(quiz_name: "First_quiz", franchise_id: "1", video_url: "www.google.com", video_completed: false)
Quiz.create(quiz_name: "Second_quiz", franchise_id: "2", video_url: "www.amazon.com", video_completed: false)

puts "Creating quiz 3 questions for first quiz..."
QuizQuestion.create(quiz_id: "1", question: "How to make good coffee?")
QuizQuestion.create(quiz_id: "1", question: "How to make good tea?")
QuizQuestion.create(quiz_id: "1", question: "How to make good sandwich?")

puts "Creating quiz options"
QuizOption.create(content: "first_option", quiz_question_id: 1, correct_answer: false)
QuizOption.create(content: "second_option", quiz_question_id: 1, correct_answer: true)
QuizOption.create(content: "third_option", quiz_question_id: 1, correct_answer: false)
QuizOption.create(content: "abc", quiz_question_id: 2, correct_answer: false)
QuizOption.create(content: "xyz", quiz_question_id: 2, correct_answer: true)

puts "Creating quiz attempts"
QuizAttempt.create(licence_id: 1, quiz_id: 1, passed: false)
QuizAttempt.create(licence_id: 1, quiz_id: 2, passed: false)

puts "Creating quiz answers"
QuizAnswer.create(quiz_question_id: "1", quiz_attempt_id: "1", quiz_option_id: 1)
QuizAnswer.create(quiz_question_id: "2", quiz_attempt_id: "1", quiz_option_id: 2)
QuizAnswer.create(quiz_question_id: "3", quiz_attempt_id: "1", quiz_option_id: 3)

puts "Finish Seeding!"
