# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_24_162753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approved_franchises", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "franchise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchise_id"], name: "index_approved_franchises_on_franchise_id"
    t.index ["profile_id"], name: "index_approved_franchises_on_profile_id"
  end

  create_table "company_comments", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "company_profiles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profiles_id"], name: "index_company_comments_on_company_profiles_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "uen", null: false
    t.text "address", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "url"
    t.string "paid_up_capital", null: false
    t.string "last_fy_revenue", null: false
    t.string "legal_disputes", null: false
    t.index ["profile_id"], name: "index_company_profiles_on_profile_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["user_id"], name: "index_franchises_on_user_id"
  end

  create_table "licence_comments", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "licence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["licence_id"], name: "index_licence_comments_on_licence_id"
  end

  create_table "licences", force: :cascade do |t|
    t.bigint "company_profile_id", null: false
    t.bigint "franchise_id", null: false
    t.text "proposed_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licence_status", default: "pending", null: false
    t.index ["company_profile_id"], name: "index_licences_on_company_profile_id"
    t.index ["franchise_id"], name: "index_licences_on_franchise_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "operational_status"
    t.bigint "licence_id", null: false
    t.bigint "franchise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchise_id"], name: "index_partners_on_franchise_id"
    t.index ["licence_id"], name: "index_partners_on_licence_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.text "country"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quiz_answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "quiz_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_attempt_id"
    t.index ["quiz_attempt_id"], name: "index_quiz_answers_on_quiz_attempt_id"
    t.index ["quiz_question_id"], name: "index_quiz_answers_on_quiz_question_id"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.integer "quiz_score", null: false
    t.string "quiz_status", null: false
    t.bigint "partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_quiz_attempts_on_partner_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.string "question"
    t.string "correct_option"
    t.string "wrong_option_one"
    t.string "wrong_option_two"
    t.string "wrong_option_three"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "quiz_name"
    t.bigint "franchise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchise_id"], name: "index_quizzes_on_franchise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "approved_franchises", "franchises"
  add_foreign_key "approved_franchises", "profiles"
  add_foreign_key "company_comments", "company_profiles", column: "company_profiles_id"
  add_foreign_key "company_profiles", "profiles"
  add_foreign_key "franchises", "users"
  add_foreign_key "licence_comments", "licences"
  add_foreign_key "licences", "company_profiles"
  add_foreign_key "licences", "franchises"
  add_foreign_key "partners", "franchises"
  add_foreign_key "partners", "licences"
  add_foreign_key "profiles", "users"
  add_foreign_key "quiz_answers", "quiz_attempts"
  add_foreign_key "quiz_answers", "quiz_questions"
  add_foreign_key "quiz_attempts", "partners"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "franchises"
end
