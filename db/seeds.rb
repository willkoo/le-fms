# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# company_1.acra.attach(io: File.open('/images/acra.pdf'), filename: 'acra.pdf')
puts "cleaning database"
Licence.destroy_all
CompanyProfile.destroy_all
Quiz.destroy_all
QuizQuestion.destroy_all
QuizAnswer.destroy_all
QuizAttempt.destroy_all
QuizOption.destroy_all
Franchise.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(email: "admin@gmail.com", password: "password", admin: true)
user2 = User.create!(email: "user1@gmail.com", password: "password")
user3 = User.create!(email: "user2@gmail.com", password: "password")

puts "Creating franchises..."

puts "Creating (user) profiles..."

prof1 = Profile.create!(user: user1, first_name: "Willie", last_name: "Khoo", contact_number: "91234567", description: "Owner's account with two assigned franchise.", country: "Singapore")
prof2 = Profile.create!(user: user2, first_name: "Zong", last_name: "Han", contact_number: "91234567", description: "Hello, I am a serial entrepreneur who is interested in growing franchise operations across the world!", country: "Singapore")
prof3 = Profile.create!(user: user3, first_name: "Lester", last_name: "Wee", contact_number: "98892834", description: "Hello, I am a serial entrepreneur who is interested in growing franchise operations across the world!", country: "Singapore")

starbucks = Franchise.create!(name: "Starbucks", user: user1, description: "It happens millions of times each week – a customer receives a drink from a Starbucks barista - but each interaction is unique.")
kfc = Franchise.create!(name: "KFC", user: user2, description: "Finger Lickin Good.")

puts "Creating companies..."

company_1 = CompanyProfile.create!(name: "One Dime Consulting", uen: "200112345A", address: "1 North Street", profile: prof2, url: "www.1north.com", status: "verified", paid_up_capital: 200000, last_fy_revenue: 800000, legal_disputes: "No legal issues.")
company_1.acra.attach(io: File.open("#{Rails.root}/app/assets/images/acra.pdf"), filename: 'acra.pdf')
company_1.financial_statement.attach(io: File.open("#{Rails.root}/app/assets/images/financial.pdf"), filename: 'financial.pdf')
company_1.relevant_licences.attach(io: File.open("#{Rails.root}/app/assets/images/licence.pdf"), filename: 'licence.pdf')

company_2 = CompanyProfile.create!(name: "Trifecta Holdings", uen: "200122325B", address: "2-Sky Towers", profile: prof2, url: "www.trifassets.com", status: "verified", paid_up_capital: 250000, last_fy_revenue: 1700400, legal_disputes: "No legal issues.")
company_2.acra.attach(io: File.open("#{Rails.root}/app/assets/images/acra.pdf"), filename: 'acra.pdf')
company_2.financial_statement.attach(io: File.open("#{Rails.root}/app/assets/images/financial.pdf"), filename: 'financial.pdf')
company_2.relevant_licences.attach(io: File.open("#{Rails.root}/app/assets/images/licence.pdf"), filename: 'licence.pdf')

company_3 = CompanyProfile.create!(name: "Dual Assets Consultancy", uen: "200122325B", address: "2net towers", profile: prof3, url: "www.2net.com", status: "pending", paid_up_capital: 300000, last_fy_revenue: 600000, legal_disputes: "No legal issues.")
company_3.acra.attach(io: File.open("#{Rails.root}/app/assets/images/acra.pdf"), filename: 'acra.pdf')
company_3.financial_statement.attach(io: File.open("#{Rails.root}/app/assets/images/financial.pdf"), filename: 'financial.pdf')
company_3.relevant_licences.attach(io: File.open("#{Rails.root}/app/assets/images/licence.pdf"), filename: 'licence.pdf')


puts "Creating licenses..."
licence1 = Licence.create!(company_profile: company_1, franchise: starbucks, proposed_location: "20 Collyer Quay", licence_status: "approved")
licence1.proposal.attach(io: File.open("#{Rails.root}/app/assets/images/proposal.pdf"), filename: 'proposal.pdf')

licence2 = Licence.create!(company_profile: company_1, franchise: kfc, proposed_location: "912 Baker Street", licence_status: "pending")
licence2.proposal.attach(io: File.open("#{Rails.root}/app/assets/images/proposal.pdf"), filename: 'proposal.pdf')

licence3 = Licence.create!(company_profile: company_2, franchise: starbucks, proposed_location: "123 Clayton Street", licence_status: "pending")
licence3.proposal.attach(io: File.open("#{Rails.root}/app/assets/images/proposal.pdf"), filename: 'proposal.pdf')

licence4 = Licence.create!(company_profile: company_2, franchise: kfc, proposed_location: "42 Margaret Drive", licence_status: "pending")
licence4.proposal.attach(io: File.open("#{Rails.root}/app/assets/images/proposal.pdf"), filename: 'proposal.pdf')

puts "Creating quizzes..."
espresso = Quiz.create!(quiz_name: "Espresso 101", franchise: starbucks, video_url: "fdW6twhmiIA", video_completed: false)
coldbrew = Quiz.create!(quiz_name: "Science of Coldbrew", franchise: starbucks, video_url: "An6LvWQuj_8", video_completed: false)
chicken = Quiz.create!(quiz_name: "Process of frying", franchise: kfc, video_url: "www.chicken.com", video_completed: false)

puts "Creating questions for espresso..."
q1 = QuizQuestion.create!(quiz: espresso, question: "How many milliliters are there in one shot of espresso?")
q2 = QuizQuestion.create!(quiz: espresso, question: "How many grams of coffee are required for one shot of espresso?")
q3 = QuizQuestion.create!(quiz: espresso, question: "What is the serving size of a Grande?")
q4 = QuizQuestion.create!(quiz: espresso, question: "What is the serving size of a hot Venti?")

puts "Creating quiz options for espresso"
QuizOption.create!(content: "25ml - 30ml", quiz_question: q1, correct_answer: true)
QuizOption.create!(content: "40ml - 45ml", quiz_question: q1, correct_answer: false)
QuizOption.create!(content: "45ml - 50ml", quiz_question: q1, correct_answer: false)
QuizOption.create!(content: "7g - 9g", quiz_question: q2, correct_answer: true)
QuizOption.create!(content: "5g - 7g", quiz_question: q2, correct_answer: false)
QuizOption.create!(content: "10g - 12g", quiz_question: q2, correct_answer: false)
QuizOption.create!(content: "16 fl. oz.", quiz_question: q3, correct_answer: true)
QuizOption.create!(content: "12 fl. oz.", quiz_question: q3, correct_answer: false)
QuizOption.create!(content: "10 fl. oz.", quiz_question: q3, correct_answer: false)
QuizOption.create!(content: "20 fl. oz.", quiz_question: q4, correct_answer: true)
QuizOption.create!(content: "22 fl. oz.", quiz_question: q4, correct_answer: false)
QuizOption.create!(content: "24 fl. oz.", quiz_question: q4, correct_answer: false)

puts "Creating questions for coldbrew..."
q5 = QuizQuestion.create!(quiz: coldbrew, question: "What is Cold Brew infused with?")
q6 = QuizQuestion.create!(quiz: coldbrew, question: "How long should the Cold Brew be steeped for?")
q7 = QuizQuestion.create!(quiz: coldbrew, question: "What is the serving size of a Grande?")
q8 = QuizQuestion.create!(quiz: coldbrew, question: "What is the serving size of a cold Venti?")

puts "Creating quiz options for coldbrew"
QuizOption.create!(content: "nitrogen", quiz_question: q5, correct_answer: true)
QuizOption.create!(content: "carbon dioxide", quiz_question: q5, correct_answer: false)
QuizOption.create!(content: "oxygen", quiz_question: q5, correct_answer: false)
QuizOption.create!(content: "20 hours", quiz_question: q6, correct_answer: true)
QuizOption.create!(content: "15 hours", quiz_question: q6, correct_answer: false)
QuizOption.create!(content: "25 hours", quiz_question: q6, correct_answer: false)
QuizOption.create!(content: "16 fl. oz.", quiz_question: q7, correct_answer: true)
QuizOption.create!(content: "12 fl. oz.", quiz_question: q7, correct_answer: false)
QuizOption.create!(content: "10 fl. oz.", quiz_question: q7, correct_answer: false)
QuizOption.create!(content: "24 fl. oz.", quiz_question: q8, correct_answer: true)
QuizOption.create!(content: "22 fl. oz.", quiz_question: q8, correct_answer: false)
QuizOption.create!(content: "20 fl. oz.", quiz_question: q8, correct_answer: false)

puts "Creating questions for chicken..."
q9 = QuizQuestion.create!(quiz: chicken, question: "What type of oil is used to fry chickens?")
q10 = QuizQuestion.create!(quiz: chicken, question: "How long should each batch of chickens be fried for?")
q11 = QuizQuestion.create!(quiz: chicken, question: "What is the ideal oil temperature for frying chickens?")

puts "Creating quiz options for chicken..."
QuizOption.create!(content: "Vegetable Oil", quiz_question: q9, correct_answer: true)
QuizOption.create!(content: "Chicken Oil", quiz_question: q9, correct_answer: false)
QuizOption.create!(content: "Corn Oil", quiz_question: q9, correct_answer: false)
QuizOption.create!(content: "12 mins", quiz_question: q10, correct_answer: true)
QuizOption.create!(content: "10 mins", quiz_question: q10, correct_answer: false)
QuizOption.create!(content: "15 mins", quiz_question: q10, correct_answer: false)
QuizOption.create!(content: "325 degree Fahrenheit", quiz_question: q11, correct_answer: true)
QuizOption.create!(content: "300 degree Fahrenheit", quiz_question: q11, correct_answer: false)
QuizOption.create!(content: "350 degree Fahrenheit", quiz_question: q11, correct_answer: false)

puts "Finished Seeding!"
