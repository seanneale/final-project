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

ActiveRecord::Schema.define(version: 20161116061848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_players", force: :cascade do |t|
    t.integer  "game_team_id"
    t.integer  "source_player_id"
    t.boolean  "available"
    t.integer  "injury_type",             default: 0
    t.integer  "recovery_length",         default: 0
    t.integer  "season_shots",            default: 0
    t.integer  "season_goals_scored",     default: 0
    t.integer  "season_assists",          default: 0
    t.integer  "season_attempted_passes", default: 0
    t.integer  "season_succesful_passes", default: 0
    t.integer  "season_interceptions",    default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "appearances",             default: 0
    t.index ["game_team_id"], name: "index_game_players_on_game_team_id", using: :btree
    t.index ["source_player_id"], name: "index_game_players_on_source_player_id", using: :btree
  end

  create_table "game_players_match_stats", force: :cascade do |t|
    t.integer  "game_player_id"
    t.integer  "match_stat_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["game_player_id"], name: "index_game_players_match_stats_on_game_player_id", using: :btree
    t.index ["match_stat_id"], name: "index_game_players_match_stats_on_match_stat_id", using: :btree
  end

  create_table "game_team_matches", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "game_team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["game_team_id"], name: "index_game_team_matches_on_game_team_id", using: :btree
    t.index ["match_id"], name: "index_game_team_matches_on_match_id", using: :btree
  end

  create_table "game_teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.integer  "source_team_id"
    t.integer  "win",             default: 0
    t.integer  "draw",            default: 0
    t.integer  "loss",            default: 0
    t.integer  "goals_for",       default: 0
    t.integer  "goals_against",   default: 0
    t.integer  "goal_difference", default: 0
    t.integer  "points",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["league_id"], name: "index_game_teams_on_league_id", using: :btree
    t.index ["source_team_id"], name: "index_game_teams_on_source_team_id", using: :btree
    t.index ["user_id"], name: "index_game_teams_on_user_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "league_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "match_events", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "event_type"
    t.string   "event_text"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "time"
    t.integer  "possesion_zone"
    t.index ["match_id"], name: "index_match_events_on_match_id", using: :btree
  end

  create_table "match_stats", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "shots",            default: 0
    t.integer  "goals_scored",     default: 0
    t.integer  "assists",          default: 0
    t.integer  "attempted_passes", default: 0
    t.integer  "succesful_passes", default: 0
    t.integer  "interceptions",    default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["match_id"], name: "index_match_stats_on_match_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "round_id"
    t.boolean  "played",           default: false
    t.boolean  "background",       default: false
    t.boolean  "home_team_picked", default: false
    t.boolean  "away_team_picked", default: false
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_team_score",  default: 0
    t.integer  "away_team_score",  default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "control",          default: true
    t.integer  "possesion_zone",   default: 4
    t.index ["round_id"], name: "index_matches_on_round_id", using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "league_id"
    t.date     "date"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_rounds_on_league_id", using: :btree
  end

  create_table "source_players", force: :cascade do |t|
    t.integer  "source_team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "position"
    t.float    "attacking_ability"
    t.float    "defending_ability"
    t.float    "goalkeeping_ability"
    t.integer  "squad_number"
    t.float    "form_adjustment"
    t.string   "image_url"
    t.boolean  "available"
    t.integer  "injury_remain"
    t.integer  "injury_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["source_team_id"], name: "index_source_players_on_source_team_id", using: :btree
  end

  create_table "source_teams", force: :cascade do |t|
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

  create_table "user_leagues", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_user_leagues_on_league_id", using: :btree
    t.index ["user_id"], name: "index_user_leagues_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.datetime "oauth_expires_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
