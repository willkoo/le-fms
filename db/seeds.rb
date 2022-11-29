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
Licence.create!(company_profile: company_1, franchise: starbucks, proposed_location: "20 Collyer Quay", licence_status: "approved")
Licence.create!(company_profile: company_1, franchise: kfc, proposed_location: "912 Baker Street", licence_status: "pending")
Licence.create!(company_profile: company_2, franchise: starbucks, proposed_location: "123 Clayton Street", licence_status: "pending")
Licence.create!(company_profile: company_2, franchise: kfc, proposed_location: "42 Margaret Drive", licence_status: "pending")

puts "Creating quizzes..."
coffee_quiz = Quiz.create!(quiz_name: "coffee_quiz", franchise: starbucks, video_url: "www.coffee.com", video_completed: false)
coldbrew_quiz = Quiz.create!(quiz_name: "coldbrew_quiz", franchise: starbucks, video_url: "www.coldbrewcoffee.com", video_completed: false)

chicken_quiz = Quiz.create!(quiz_name: "chicken_quiz", franchise: kfc, video_url: "www.chicken.com", video_completed: false)

puts "Creating questions for coffee_quiz..."
QuizQuestion.create!(quiz: coffee_quiz, question: "How many milliliters in one shot of espresso?")
QuizQuestion.create!(quiz: coffee_quiz, question: "How many grams of coffee in one shot of espresso?")
QuizQuestion.create!(quiz: coffee_quiz, question: "What is the serving size of a Grande?")
QuizQuestion.create!(quiz: coffee_quiz, question: "What is the serving size of a hot Venti?")

puts "Creating quiz options for coffee_quiz"
QuizOption.create!(content: "25ml - 30ml", quiz_question_id: 1, correct_answer: true)
QuizOption.create!(content: "40ml - 45ml", quiz_question_id: 1, correct_answer: false)
QuizOption.create!(content: "45ml - 50ml", quiz_question_id: 1, correct_answer: false)
QuizOption.create!(content: "7g - 9g", quiz_question_id: 2, correct_answer: true)
QuizOption.create!(content: "5g - 7g", quiz_question_id: 2, correct_answer: false)
QuizOption.create!(content: "10g - 12g", quiz_question_id: 2, correct_answer: false)
QuizOption.create!(content: "16 fl. oz.", quiz_question_id: 3, correct_answer: true)
QuizOption.create!(content: "12 fl. oz.", quiz_question_id: 3, correct_answer: false)
QuizOption.create!(content: "10 fl. oz.", quiz_question_id: 3, correct_answer: false)
QuizOption.create!(content: "20 fl. oz.", quiz_question_id: 4, correct_answer: true)
QuizOption.create!(content: "22 fl. oz.", quiz_question_id: 4, correct_answer: false)
QuizOption.create!(content: "24 fl. oz.", quiz_question_id: 4, correct_answer: false)

puts "Creating questions for coldbrew_quiz..."
QuizQuestion.create!(quiz: coldbrew_quiz, question: "What is Cold Brew infused with?")
QuizQuestion.create!(quiz: coldbrew_quiz, question: "How long should the Cold Brew be steeped for?")
QuizQuestion.create!(quiz: coldbrew_quiz, question: "What is the serving size of a Grande?")
QuizQuestion.create!(quiz: coldbrew_quiz, question: "What is the serving size of a cold Venti?")

puts "Creating quiz options for coldbrew_quiz"
QuizOption.create!(content: "nitrogen", quiz_question_id: 5, correct_answer: true)
QuizOption.create!(content: "carbon dioxide", quiz_question_id: 5, correct_answer: false)
QuizOption.create!(content: "oxygen", quiz_question_id: 5, correct_answer: false)
QuizOption.create!(content: "20 hours", quiz_question_id: 6, correct_answer: true)
QuizOption.create!(content: "15 hours", quiz_question_id: 6, correct_answer: false)
QuizOption.create!(content: "25 hours", quiz_question_id: 6, correct_answer: false)
QuizOption.create!(content: "16 fl. oz.", quiz_question_id: 7, correct_answer: true)
QuizOption.create!(content: "12 fl. oz.", quiz_question_id: 7, correct_answer: false)
QuizOption.create!(content: "10 fl. oz.", quiz_question_id: 7, correct_answer: false)
QuizOption.create!(content: "24 fl. oz.", quiz_question_id: 8, correct_answer: true)
QuizOption.create!(content: "22 fl. oz.", quiz_question_id: 8, correct_answer: false)
QuizOption.create!(content: "20 fl. oz.", quiz_question_id: 8, correct_answer: false)

puts "Creating questions for chicken_quiz..."
QuizQuestion.create!(quiz: chicken_quiz, question: "What oil is used to fry chickens?")
QuizQuestion.create!(quiz: chicken_quiz, question: "How long should each batch of chickens be fried for?")
QuizQuestion.create!(quiz: chicken_quiz, question: "What is the ideal oil temperature for frying chickens?")

puts "Creating quiz options for chicken_quiz"
QuizOption.create!(content: "Vegetable Oil", quiz_question_id: 9, correct_answer: true)
QuizOption.create!(content: "Chicken Oil", quiz_question_id: 9, correct_answer: false)
QuizOption.create!(content: "Corn Oil", quiz_question_id: 9, correct_answer: false)
QuizOption.create!(content: "12 mins", quiz_question_id: 10, correct_answer: true)
QuizOption.create!(content: "10 mins", quiz_question_id: 10, correct_answer: false)
QuizOption.create!(content: "15 mins", quiz_question_id: 10, correct_answer: false)
QuizOption.create!(content: "325 degree Fahrenheit", quiz_question_id: 11, correct_answer: true)
QuizOption.create!(content: "300 degree Fahrenheit", quiz_question_id: 11, correct_answer: false)
QuizOption.create!(content: "350 degree Fahrenheit", quiz_question_id: 11, correct_answer: false)

puts "Finish Seeding!"
