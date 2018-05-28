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

ActiveRecord::Schema.define(version: 20180524000528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance", primary_key: ["schedule_id", "student_id"], force: :cascade do |t|
    t.integer "schedule_id", default: 0, null: false
    t.integer "student_id", default: 0, null: false
    t.string "attend_status", limit: 10
    t.string "description", limit: 40
  end

  create_table "course", primary_key: "course_id", id: :string, limit: 20, default: "", force: :cascade do |t|
    t.string "course_title", limit: 50
    t.string "topic", limit: 100
    t.integer "day_length"
    t.integer "price", default: 0, null: false
    t.integer "level_id"
    t.string "category", limit: 40
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_id"
    t.string "course_title"
    t.string "topic"
    t.integer "day_length"
    t.integer "price"
    t.integer "level_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partner", primary_key: "instructor_id", id: :string, limit: 11, default: "", force: :cascade do |t|
    t.string "last_name", limit: 30
    t.string "first_name", limit: 30
    t.string "e_mail", limit: 30
  end

  create_table "schedule", primary_key: "schedule_id", id: :integer, default: nil, force: :cascade do |t|
    t.date "schedule_date"
    t.integer "classroom_id"
    t.string "course_id", limit: 11
    t.string "instructor_id", limit: 11
  end

  create_table "student", primary_key: "student_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "last_name", limit: 20
    t.string "first_name", limit: 30
    t.string "company", limit: 30
    t.string "tel", limit: 15
    t.string "e_mail", limit: 30
  end

end
