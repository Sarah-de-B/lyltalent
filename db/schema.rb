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

ActiveRecord::Schema[7.1].define(version: 2025_08_26_095311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "availabilities", force: :cascade do |t|
    t.date "starts_on"
    t.date "ends_on"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "entertainment_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entertainment_application_id"], name: "index_chats_on_entertainment_application_id"
  end

  create_table "entertainment_applications", force: :cascade do |t|
    t.string "message"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "entertainment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entertainment_id"], name: "index_entertainment_applications_on_entertainment_id"
    t.index ["user_id"], name: "index_entertainment_applications_on_user_id"
  end

  create_table "entertainments", force: :cascade do |t|
    t.string "artist_type"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "included_services", default: [], array: true
    t.string "artist_experience_in_years"
    t.integer "duration_in_minutes"
    t.string "available_tool"
    t.string "necessary_tool"
    t.string "planned_remuneration"
    t.integer "planned_remuneration_in_euros"
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_entertainments_on_event_id"
    t.index ["user_id"], name: "index_entertainments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "category"
    t.integer "duration"
    t.string "address"
    t.integer "estimated_public_in_number"
    t.integer "public_age"
    t.string "musical_styles", default: [], array: true
    t.string "cover_or_composition"
    t.integer "number_of_artists_needed"
    t.string "name"
    t.text "description"
    t.boolean "vehicule", default: false
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "artist_name"
    t.string "phone_number"
    t.string "role"
    t.string "address"
    t.string "instruments", default: [], array: true
    t.string "musical_styles", default: [], array: true
    t.string "instagram_url"
    t.string "facebook_url"
    t.string "spotify_url"
    t.string "youtube_url"
    t.boolean "covers", default: false
    t.boolean "original_composition", default: false
    t.integer "stage_time_in_minutes"
    t.string "tools"
    t.string "tools_needed"
    t.string "legal_entity_type"
    t.string "siret"
    t.integer "concert_number"
    t.text "description_education"
    t.text "description_experience"
    t.string "price"
    t.text "bio"
    t.string "artist_type"
    t.boolean "vehicule", default: false
    t.date "date_of_birth"
    t.boolean "epk_completed", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "availabilities", "users"
  add_foreign_key "chats", "entertainment_applications"
  add_foreign_key "entertainment_applications", "entertainments"
  add_foreign_key "entertainment_applications", "users"
  add_foreign_key "entertainments", "events"
  add_foreign_key "entertainments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
