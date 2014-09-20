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

ActiveRecord::Schema.define(version: 20140920103211) do

  create_table "locations", force: true do |t|
    t.string "name"
  end

  create_table "records", force: true do |t|
    t.integer "report_id"
    t.string  "name"
    t.integer "huge"
    t.integer "big"
    t.integer "medium"
    t.integer "small"
  end

  add_index "records", ["report_id"], name: "index_records_on_report_id"

  create_table "reports", force: true do |t|
    t.integer "location_id"
    t.integer "month"
    t.integer "year"
  end

  add_index "reports", ["location_id"], name: "index_reports_on_location_id"

end