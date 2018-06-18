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

ActiveRecord::Schema.define(version: 20180618191957) do

  create_table "books", force: :cascade do |t|
    t.string   "autor"
    t.string   "name",         limit: 10
    t.integer  "year"
    t.string   "genre"
    t.integer  "reading_time"
    t.integer  "rate"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name_g"
    t.string   "developer"
    t.string   "genre"
    t.string   "description"
    t.string   "trailer"
    t.string   "platform"
    t.boolean  "wanna_play"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.date     "date_added",        default: '2018-06-12'
    t.string   "release_date_PS4"
    t.string   "release_date_Xbox"
    t.string   "release_date_PC"
    t.string   "release_date_NS"
    t.string   "note"
  end

  create_table "releases", force: :cascade do |t|
    t.string   "game_n"
    t.date     "date"
    t.string   "platform"
    t.string   "note"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "releases", ["game_id"], name: "index_releases_on_game_id"

  create_table "sommodels", force: :cascade do |t|
    t.string   "first_col"
    t.string   "second_col"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
