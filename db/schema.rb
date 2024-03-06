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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_110149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.integer "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookstores", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlist_items", force: :cascade do |t|
    t.bigint "playlist_id", null: false
    t.bigint "reading_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_items_on_playlist_id"
    t.index ["reading_id"], name: "index_playlist_items_on_reading_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "readings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.text "comment"
    t.float "my_rating"
    t.integer "reading_status"
    t.string "shared_to"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_readings_on_book_id"
    t.index ["user_id"], name: "index_readings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.float "rating"
    t.bigint "reading_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_id"], name: "index_reviews_on_reading_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.bigint "sender_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_suggestions_on_book_id"
    t.index ["sender_id"], name: "index_suggestions_on_sender_id"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "playlist_items", "playlists"
  add_foreign_key "playlist_items", "readings"
  add_foreign_key "playlists", "users"
  add_foreign_key "readings", "books"
  add_foreign_key "readings", "users"
  add_foreign_key "reviews", "readings"
  add_foreign_key "reviews", "users"
  add_foreign_key "suggestions", "books"
  add_foreign_key "suggestions", "users"
  add_foreign_key "suggestions", "users", column: "sender_id"
end
