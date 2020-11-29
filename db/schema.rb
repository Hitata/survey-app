# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_29_154613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "publishers", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_publishers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_publishers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_publishers_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_publishers_on_uid_and_provider", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "options", array: true
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["options"], name: "index_questions_on_options", using: :gin
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "publisher_id"
    t.index ["publisher_id"], name: "index_surveys_on_publisher_id"
  end

  add_foreign_key "questions", "surveys"
  add_foreign_key "surveys", "publishers"
end
