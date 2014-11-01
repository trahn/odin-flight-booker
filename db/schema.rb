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

ActiveRecord::Schema.define(version: 20141031130917) do

  create_table "airports", force: true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pax"
    t.integer  "flight_id"
  end

  create_table "bookings_passengers", force: true do |t|
    t.integer "booking_id"
    t.integer "passenger_id"
  end

  create_table "flights", force: true do |t|
    t.integer  "start_id"
    t.integer  "finish_id"
    t.datetime "takeoff"
    t.time     "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flights", ["start_id", "finish_id"], name: "index_flights_on_start_id_and_finish_id"

  create_table "passengers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
