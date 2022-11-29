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
User.create!(email: "admin@gmail.com", password: "password", admin: true)
User.create!(email: "user1@gmail.com", password: "password")
User.create!(email: "user2@gmail.com", password: "password")

puts "Creating franchises..."

starbucks = Franchise.create!(name: "Starbucks", user_id: "1", description: "It happens millions of times each week – a customer receives a drink from a Starbucks barista - but each interaction is unique.")
kfc = Franchise.create!(name: "KFC", user_id: "2", description: "Finger Lickin Good.")

puts "Creating (user) profiles..."
Profile.create!(user_id: "1", first_name: "Willie", last_name: "Khoo", contact_number: "91234567", description: "This is owner's account with one assigned franchise.", country: "Singapore")
Profile.create!(user_id: "2", first_name: "Collin", last_name: "Chua", contact_number: "91234567", description: "This is an applicant account with one assigned company.", country: "Singapore")
Profile.create!(user_id: "3", first_name: "Lester", last_name: "Wee", contact_number: "98892834", description: "This is the 2nd applicant account with 2 assigned companies.", country: "Singapore")

puts "Creating companies..."
company_1 = CompanyProfile.create!(name: "company_1", uen: "200112345A", address: "1north towers", profile_id: "2", url: "www.1north.com", status: "verified", paid_up_capital: 100000, last_fy_revenue: 800000, legal_disputes: "No legal issues.")
company_2 = CompanyProfile.create!(name: "company_2", uen: "200122325B", address: "2sky towers", profile_id: "2", url: "www.2ky.com", status: "verified", paid_up_capital: 200000, last_fy_revenue: 700000, legal_disputes: "No legal issues.")
company_3 = CompanyProfile.create!(name: "company_3", uen: "200122325B", address: "2net towers", profile_id: "3", url: "www.2net.com", status: "pending", paid_up_capital: 300000, last_fy_revenue: 600000, legal_disputes: "No legal issues.")

puts "Creating licenses..."
Licence.create!(company_profile: company_1, franchise: starbucks, proposed_location: "20 Collyer Quay", licence_status: "pending")
Licence.create!(company_profile: company_2, franchise: kfc, proposed_location: "912 Baker Street", licence_status: "pending")
Licence.create!(company_profile: company_1, franchise: starbucks, proposed_location: "123 Clayton Street", licence_status: "pending")
Licence.create!(company_profile: company_2, franchise: kfc, proposed_location: "42 Margaret Drive", licence_status: "pending")

puts "Creating quizzes..."
coffee_quiz = Quiz.create!(quiz_name: "coffee_quiz", franchise: starbucks, video_url: "www.coffee.com", video_completed: false)
tea_quiz = Quiz.create!(quiz_name: "tea_quiz", franchise: starbucks, video_url: "www.tea.com", video_completed: false)
cake_quiz = Quiz.create!(quiz_name: "cake_quiz", franchise: starbucks, video_url: "www.cake.com", video_completed: false)
chicken_quiz = Quiz.create!(quiz_name: "chicken_quiz", franchise: kfc, video_url: "www.chicken.com", video_completed: false)
drumlet_quiz = Quiz.create!(quiz_name: "drumlet_quiz", franchise: kfc, video_url: "www.drumlet.com", video_completed: false)
wings_quiz = Quiz.create!(quiz_name: "wings_quiz", franchise: kfc, video_url: "www.wings.com", video_completed: false)

puts "Creating quiz 3 questions for first two quiz..."
QuizQuestion.create!(quiz: coffee_quiz, question: "How to make good coffee?")
QuizQuestion.create!(quiz: coffee_quiz, question: "How to make good tea?")
QuizQuestion.create!(quiz: coffee_quiz, question: "How to make roast coffee beans?")
QuizQuestion.create!(quiz: tea_quiz, question: "How to fry chicken?")
QuizQuestion.create!(quiz: tea_quiz, question: "Fry chicken for how long?")
QuizQuestion.create!(quiz: tea_quiz, question: "How to make popcorn chicken?")

puts "Creating quiz options"
QuizOption.create!(content: "first_option", quiz_question_id: 1, correct_answer: false)
QuizOption.create!(content: "second_option", quiz_question_id: 1, correct_answer: true)
QuizOption.create!(content: "third_option", quiz_question_id: 1, correct_answer: false)
QuizOption.create!(content: "first_option", quiz_question_id: 2, correct_answer: false)
QuizOption.create!(content: "second_option", quiz_question_id: 2, correct_answer: true)
QuizOption.create!(content: "third_option", quiz_question_id: 2, correct_answer: false)

puts "Creating quiz attempts"
QuizAttempt.create!(licence_id: 1, quiz: coffee_quiz, passed: false)
QuizAttempt.create!(licence_id: 1, quiz: tea_quiz, passed: false)

puts "Creating quiz answers"
QuizAnswer.create!(quiz_question_id: "1", quiz_attempt_id: "1", quiz_option_id: 1)
QuizAnswer.create!(quiz_question_id: "2", quiz_attempt_id: "1", quiz_option_id: 2)
QuizAnswer.create!(quiz_question_id: "3", quiz_attempt_id: "1", quiz_option_id: 3)

puts "Finish Seeding!"
