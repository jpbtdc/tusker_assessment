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

ActiveRecord::Schema.define(version: 20160105153700) do

  create_table "box_contents", force: :cascade do |t|
    t.string  "code"
    t.integer "box_id"
    t.index ["box_id"], name: "index_box_contents_on_box_id"
  end

  create_table "boxes", force: :cascade do |t|
    t.string "code"
    t.index ["code"], name: "index_boxes_on_code", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_customers_on_name", unique: true
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "delivery_city"
    t.datetime "requested_on"
    t.datetime "sent_on"
    t.datetime "received_on"
    t.index ["customer_id"], name: "index_shipments_on_customer_id"
  end

end
