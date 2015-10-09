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

ActiveRecord::Schema.define(version: 20151006181951) do

  create_table "constraints", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "one_id"
    t.integer  "other_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "constraints", ["event_id"], name: "index_constraints_on_event_id"
  add_index "constraints", ["one_id"], name: "index_constraints_on_one_id"
  add_index "constraints", ["other_id"], name: "index_constraints_on_other_id"

  create_table "draws", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "sent_at"
  end

  add_index "draws", ["event_id"], name: "index_draws_on_event_id"
  add_index "draws", ["giver_id"], name: "index_draws_on_giver_id"
  add_index "draws", ["receiver_id"], name: "index_draws_on_receiver_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "locale",     default: "en"
    t.string   "amount"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id"

end
