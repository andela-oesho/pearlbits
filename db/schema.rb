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

ActiveRecord::Schema.define(version: 20160408001733) do

  create_table "links", force: :cascade do |t|
    t.string   "short_url"
    t.string   "actual_url"
    t.boolean  "active",     default: true
    t.boolean  "deleted",    default: false
    t.integer  "visits",     default: 0
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "vanity"
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "statistics", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "ip_address"
    t.string   "browser_information"
    t.string   "referer"
    t.integer  "link_id"
  end

  add_index "statistics", ["link_id"], name: "index_statistics_on_link_id"

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "provider"
    t.string  "uid"
    t.string  "email"
    t.integer "link_count"
  end

end
