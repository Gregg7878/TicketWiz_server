# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_26_101454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id"
    t.date "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "calendar_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "organiser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_calendar_events_on_customer_id"
    t.index ["event_id"], name: "index_calendar_events_on_event_id"
    t.index ["organiser_id"], name: "index_calendar_events_on_organiser_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.bigint "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "image_url"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "venue_name"
    t.string "event_location"
    t.integer "available_tickets_count"
    t.bigint "organiser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["organiser_id"], name: "index_events_on_organiser_id"
  end

  create_table "mpesas", force: :cascade do |t|
    t.string "phoneNumber"
    t.integer "amount"
    t.string "checkoutRequestID"
    t.string "merchantRequestID"
    t.string "mpesaReceiptNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "ticket_id"
    t.index ["customer_id"], name: "index_mpesas_on_customer_id"
    t.index ["ticket_id"], name: "index_mpesas_on_ticket_id"
  end

  create_table "organisers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.bigint "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "customer_id", null: false
    t.string "ticket_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "calendar_events", "customers"
  add_foreign_key "calendar_events", "events"
  add_foreign_key "calendar_events", "organisers"
  add_foreign_key "events", "organisers"
  add_foreign_key "mpesas", "customers"
  add_foreign_key "mpesas", "tickets"
  add_foreign_key "tickets", "customers"
  add_foreign_key "tickets", "events"
end
