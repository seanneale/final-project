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

ActiveRecord::Schema.define(version: 20161107014327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_games", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_active_games_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "event_type"
    t.string   "event_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "injuries", force: :cascade do |t|
    t.integer  "injury_name"
    t.integer  "min_recovery_time"
    t.integer  "max_recovery_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "league_tables", force: :cascade do |t|
    t.integer  "win"
    t.integer  "draw"
    t.integer  "loss"
    t.integer  "goals_for"
    t.integer  "goals_against"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "match_dates", force: :cascade do |t|
    t.date     "match_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.boolean  "played"
    t.boolean  "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "position"
    t.float    "attacking_ability"
    t.float    "defending_ability"
    t.float    "goalkeeping_ability"
    t.integer  "team_id"
    t.integer  "squad_number"
    t.float    "form_adjustment"
    t.string   "image_url"
    t.boolean  "available"
    t.integer  "injury_remain"
    t.integer  "injury_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "squads", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_01"
    t.integer  "player_02"
    t.integer  "player_03"
    t.integer  "player_04"
    t.integer  "player_05"
    t.integer  "player_06"
    t.integer  "player_07"
    t.integer  "player_08"
    t.integer  "player_09"
    t.integer  "player_10"
    t.integer  "player_11"
    t.integer  "player_12"
    t.integer  "player_13"
    t.integer  "player_14"
    t.integer  "player_15"
    t.boolean  "home"
    t.integer  "goals_scored"
    t.integer  "goals_conceded"
    t.integer  "match_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "home_colour_1"
    t.string   "home_colour_2"
    t.string   "away_colour_1"
    t.string   "away_colour_2"
    t.string   "badge_url"
    t.integer  "fpl_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
