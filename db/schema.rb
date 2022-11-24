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


ActiveRecord::Schema[7.0].define(version: 2022_11_23_081421) do

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

  create_table "company_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "uen", null: false
    t.text "address", null: false
    t.bigint "profile_id", null: false
    t.string "website"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_company_profiles_on_profile_id"
  end

  create_table "company_records", force: :cascade do |t|
    t.bigint "company_profile_id", null: false
    t.string "paid_up_capital", null: false
    t.string "last_fy_revenue", null: false
    t.string "legal_disputes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_company_records_on_company_profile_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_franchises_on_user_id"
  end

  create_table "licences", force: :cascade do |t|
    t.bigint "company_profile_id", null: false
    t.bigint "franchise_id", null: false
    t.text "proposed_location"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_licences_on_company_profile_id"
    t.index ["franchise_id"], name: "index_licences_on_franchise_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "country"
    t.index ["user_id"], name: "index_profiles_on_user_id"
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
  add_foreign_key "company_profiles", "profiles"
  add_foreign_key "company_records", "company_profiles"
  add_foreign_key "franchises", "users"
  add_foreign_key "licences", "company_profiles"
  add_foreign_key "licences", "franchises"
  add_foreign_key "profiles", "users"
end
