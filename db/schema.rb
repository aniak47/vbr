# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160117044320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "subtitle"
    t.integer  "staff_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["staff_id"], name: "index_articles_on_staff_id", using: :btree

  create_table "blogposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "blogposts", ["staff_id", "created_at"], name: "index_blogposts_on_staff_id_and_created_at", using: :btree
  add_index "blogposts", ["staff_id"], name: "index_blogposts_on_staff_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "blurb"
    t.string   "location"
    t.string   "catergory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["date", "catergory"], name: "index_events_on_date_and_catergory", using: :btree

  create_table "specialty_shows", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "day"
    t.time     "start"
    t.time     "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specialty_shows", ["name"], name: "index_specialty_shows_on_name", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "staffs", ["email"], name: "index_staffs_on_email", unique: true, using: :btree

  add_foreign_key "articles", "staffs"
  add_foreign_key "blogposts", "staffs"
end
