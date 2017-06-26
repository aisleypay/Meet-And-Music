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

ActiveRecord::Schema.define(version: 20170625233155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_instruments", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "instrument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_instruments_on_artist_id"
    t.index ["instrument_id"], name: "index_artist_instruments_on_instrument_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.string "setList"
    t.integer "age"
    t.integer "experience_in_years"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.string "setList"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.boolean "status"
    t.integer "decider_id"
    t.integer "chosen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_genres", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "band_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_user_genres_on_artist_id"
    t.index ["band_id"], name: "index_user_genres_on_band_id"
    t.index ["genre_id"], name: "index_user_genres_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artist_instruments", "artists"
  add_foreign_key "artist_instruments", "instruments"
  add_foreign_key "user_genres", "artists"
  add_foreign_key "user_genres", "bands"
  add_foreign_key "user_genres", "genres"
end
