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

ActiveRecord::Schema.define(version: 20150819211948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["title"], name: "index_games_on_title", unique: true, using: :btree

  create_table "play_tokens", force: :cascade do |t|
    t.string   "token",                      null: false
    t.integer  "user_id",                    null: false
    t.integer  "game_id",                    null: false
    t.boolean  "won",        default: false, null: false
    t.boolean  "complete",   default: false, null: false
    t.string   "value"
    t.datetime "expire_at",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "play_tokens", ["game_id"], name: "index_play_tokens_on_game_id", using: :btree
  add_index "play_tokens", ["user_id"], name: "index_play_tokens_on_user_id", using: :btree

  create_table "turns", force: :cascade do |t|
    t.integer  "play_token_id", null: false
    t.string   "directions",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "turns", ["play_token_id"], name: "index_turns_on_play_token_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
