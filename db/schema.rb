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

ActiveRecord::Schema.define(version: 20140423054327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backlog_sharings", force: true do |t|
    t.integer  "user_id"
    t.integer  "backlog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "backlogs", force: true do |t|
    t.string   "name"
    t.text     "story_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "backlogs", ["user_id"], name: "index_backlogs_on_user_id", using: :btree

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "who"
    t.string   "what"
    t.string   "why"
    t.text     "acceptance_criteria"
    t.text     "notes"
    t.string   "theme"
    t.boolean  "sprint_ready"
    t.integer  "story_points"
    t.integer  "business_value"
    t.integer  "backlog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.datetime "compleated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "google_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["google_uid"], name: "index_users_on_google_uid", using: :btree

end
