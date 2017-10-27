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

ActiveRecord::Schema.define(version: 20171027175102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_events", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "event_id", null: false
    t.index ["category_id", "event_id"], name: "index_categories_events_on_category_id_and_event_id"
    t.index ["event_id", "category_id"], name: "index_categories_events_on_event_id_and_category_id"
  end

  create_table "categories_profiles", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "profile_id", null: false
    t.index ["category_id", "profile_id"], name: "index_categories_profiles_on_category_id_and_profile_id"
    t.index ["profile_id", "category_id"], name: "index_categories_profiles_on_profile_id_and_category_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "events_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["events_id"], name: "index_chat_rooms_on_events_id"
  end

  create_table "chat_rooms_profiles", id: false, force: :cascade do |t|
    t.bigint "chat_room_id", null: false
    t.bigint "profile_id", null: false
    t.index ["chat_room_id", "profile_id"], name: "index_chat_rooms_profiles_on_chat_room_id_and_profile_id"
    t.index ["profile_id", "chat_room_id"], name: "index_chat_rooms_profiles_on_profile_id_and_chat_room_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.bigint "profile_id"
    t.boolean "sheck_in_url"
    t.boolean "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_check_ins_on_profile_id"
  end

  create_table "check_ins_events", id: false, force: :cascade do |t|
    t.bigint "check_in_id", null: false
    t.bigint "event_id", null: false
    t.index ["check_in_id", "event_id"], name: "index_check_ins_events_on_check_in_id_and_event_id"
    t.index ["event_id", "check_in_id"], name: "index_check_ins_events_on_event_id_and_check_in_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "author"
    t.string "title"
    t.text "description"
    t.string "date_time"
    t.float "latitude"
    t.float "longitude"
    t.boolean "private", default: false, null: false
    t.string "address"
    t.string "contacts"
    t.integer "checked_by_as", limit: 2
    t.string "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_events_on_profile_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "events_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["events_id"], name: "index_invites_on_events_id"
    t.index ["profile_id"], name: "index_invites_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "user_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "qr_teches", force: :cascade do |t|
    t.string "qr_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snoopers", force: :cascade do |t|
    t.bigint "event_id"
    t.string "facebook_token"
    t.string "facebook_event_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_snoopers_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
