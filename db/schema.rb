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

ActiveRecord::Schema.define(version: 20150329102300) do

  create_table "clients", force: :cascade do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "clients_letters", force: :cascade do |t|
    t.integer "client_id"
    t.integer "letter_id"
  end

  add_index "clients_letters", ["client_id"], name: "index_clients_letters_on_client_id"
  add_index "clients_letters", ["letter_id"], name: "index_clients_letters_on_letter_id"

  create_table "letters", force: :cascade do |t|
    t.string   "title"
    t.string   "topic"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
