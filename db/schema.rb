# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 2023_12_29_124347) do
    create_table "agencies", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 128, null: false
      t.string "website", limit: 128
      t.string "slug", limit: 128, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "total_players", default: 0, null: false
      t.integer "total_agents", default: 0, null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["slug"], name: "slug_UNIQUE", unique: true
      t.index ["website"], name: "website_UNIQUE", unique: true
    end
  
    create_table "agency_data", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "agency_id", null: false
      t.string "data", limit: 198, null: false
      t.index ["agency_id"], name: "fk_agency_data_agencies1_idx"
      t.index ["data"], name: "data_UNIQUE", unique: true
    end
  
    create_table "agents", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 64, null: false
      t.string "address", limit: 198
      t.string "phone", limit: 64
      t.string "mobile", limit: 64
      t.string "email", limit: 64
      t.integer "country_id"
      t.integer "fiba_licence"
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.string "slug", limit: 64, null: false
      t.string "skype", limit: 64
      t.string "fiba_url", limit: 198
      t.integer "agency_id"
      t.string "realgm_url", limit: 198
      t.integer "total_players", default: 0, null: false
      t.index ["agency_id"], name: "fk_agents_agencies1_idx"
      t.index ["country_id"], name: "fk_agents_countries1_idx"
      t.index ["fiba_licence"], name: "agent_fiba_licence_UNIQUE", unique: true
      t.index ["fiba_url"], name: "crawler_url_UNIQUE", unique: true
      t.index ["mobile"], name: "mobile_UNIQUE", unique: true
      t.index ["name"], name: "agent_name_UNIQUE", unique: true
      t.index ["realgm_url"], name: "realgm_url_UNIQUE", unique: true
      t.index ["skype"], name: "skype_UNIQUE", unique: true
      t.index ["slug"], name: "agent_slug_UNIQUE", unique: true
    end
  
    create_table "alerts", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id"
      t.string "description", limit: 512, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "competition_id"
      t.integer "team_id"
      t.integer "season_id"
      t.index ["competition_id"], name: "fk_alerts_competitions1_idx"
      t.index ["player_id"], name: "fk_alerts_players1_idx"
      t.index ["season_id"], name: "fk_alerts_seasons1_idx"
      t.index ["team_id"], name: "fk_alerts_teams1_idx"
    end
  
    create_table "auth_assignment", primary_key: ["item_name", "user_id"], charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.string "item_name", limit: 64, null: false, collation: "utf8_general_ci"
      t.string "user_id", limit: 64, null: false, collation: "utf8_general_ci"
      t.integer "created_at"
    end
  
    create_table "auth_item", primary_key: "name", id: { type: :string, limit: 64, collation: "utf8_general_ci" }, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.integer "type", limit: 2, null: false
      t.text "description", collation: "utf8_general_ci"
      t.string "rule_name", limit: 64, collation: "utf8_general_ci"
      t.binary "data"
      t.integer "created_at"
      t.integer "updated_at"
      t.index ["rule_name"], name: "rule_name"
      t.index ["type"], name: "idx-auth_item-type"
    end
  
    create_table "auth_item_child", primary_key: ["parent", "child"], charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.string "parent", limit: 64, null: false, collation: "utf8_general_ci"
      t.string "child", limit: 64, null: false, collation: "utf8_general_ci"
      t.index ["child"], name: "child"
    end
  
    create_table "auth_rule", primary_key: "name", id: { type: :string, limit: 64, collation: "utf8_general_ci" }, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.binary "data"
      t.integer "created_at"
      t.integer "updated_at"
    end
  
    create_table "blog", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "title", null: false
      t.text "description", size: :medium
      t.integer "date", null: false
      t.string "image"
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.string "slug", null: false
      t.integer "position"
      t.index ["position"], name: "blog_position_UNIQUE", unique: true
      t.index ["slug"], name: "blog_slug_UNIQUE", unique: true
    end
  
    create_table "blog_related", primary_key: ["blog_id_main", "blog_id_related"], charset: "utf8", force: :cascade do |t|
      t.integer "blog_id_main", null: false
      t.integer "blog_id_related", null: false
      t.index ["blog_id_main"], name: "fk_blog_has_blog_blog1_idx"
      t.index ["blog_id_related"], name: "fk_blog_has_blog_blog2_idx"
    end
  
    create_table "college_class", id: { type: :integer, limit: 1 }, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 16, null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
    end
  
    create_table "competition_name", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "competition_id", null: false
      t.string "name", limit: 128, null: false
      t.index ["competition_id"], name: "fk_competition_name_competitions1_idx"
      t.index ["name"], name: "name_UNIQUE", unique: true
    end
  
    create_table "competition_rankings", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "competitions_id", null: false
      t.string "stat", limit: 45, null: false
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.index ["competitions_id"], name: "fk_competition_rankings_competitions1_idx"
    end
  
    create_table "competition_urls", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "competition_id", null: false
      t.string "url", null: false
      t.string "player_url"
      t.string "search_url"
      t.boolean "enabled", default: false, null: false, unsigned: true
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.boolean "robot_create_players", default: false, null: false, unsigned: true
      t.boolean "robot_find_by_name", default: true, null: false, unsigned: true
      t.boolean "robot_game_by_game", default: false, null: false, unsigned: true
      t.string "crawler_strategy", limit: 63
      t.index ["competition_id"], name: "fk_competiton_urls_competitions1_idx"
    end
  
    create_table "competitions", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "country_id"
      t.string "name", limit: 33, null: false
      t.string "twitter", limit: 16
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.string "type", limit: 22
      t.integer "position"
      t.string "slug", limit: 62, null: false
      t.string "cloud_path", limit: 120
      t.string "cloud_path_thumb", limit: 120
      t.index ["country_id"], name: "competitions_countries_idx"
      t.index ["name"], name: "competition_name_unique", unique: true
      t.index ["slug"], name: "slug_UNIQUE", unique: true
    end
  
    create_table "countries", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "iso2", limit: 2, null: false
      t.string "passport", limit: 16
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.string "name", limit: 50, null: false
      t.index ["iso2"], name: "unique_iso2", unique: true
      t.index ["name"], name: "name_UNIQUE", unique: true
    end
  
    create_table "country_names", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "country_id", null: false
      t.string "name", limit: 50, null: false
      t.integer "default", default: 0, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["country_id"], name: "fk_country_names_countries1_idx"
      t.index ["name"], name: "unique_name", unique: true
    end
  
    create_table "coupon", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "code", null: false
      t.string "role", limit: 64, default: "user", null: false
      t.integer "days", default: 14, null: false
      t.integer "user_id"
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "used_at"
      t.index ["code"], name: "couponcol_UNIQUE", unique: true
      t.index ["user_id"], name: "fk_coupon_user1_idx"
    end
  
    create_table "distinct_players", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player1_id", null: false
      t.integer "player2_id", null: false
      t.index ["player1_id", "player2_id"], name: "index_unique_player_1_2", unique: true
      t.index ["player1_id"], name: "fk_distinct_players_players1_idx"
      t.index ["player2_id"], name: "fk_distinct_players_players2_idx"
    end
  
    create_table "game_statistics", primary_key: ["id", "game_id", "player_id", "team_id"], charset: "utf8", force: :cascade do |t|
      t.integer "id", null: false, unsigned: true, auto_increment: true
      t.integer "game_id", null: false
      t.integer "player_id", null: false
      t.integer "team_id", null: false
      t.integer "seconds", limit: 2, default: 0, null: false, unsigned: true
      t.integer "points", limit: 1, default: 0, null: false, unsigned: true
      t.integer "created_at", null: false, unsigned: true
      t.integer "updated_at", null: false, unsigned: true
      t.integer "is_starter", limit: 1, unsigned: true
      t.integer "field_goals_1pt_made", limit: 1, unsigned: true
      t.integer "field_goals_1pt_attempted", limit: 1, unsigned: true
      t.integer "field_goals_3pt_made", limit: 1, unsigned: true
      t.integer "field_goals_3pt_attempted", limit: 1, unsigned: true
      t.integer "field_goals_2pt_made", limit: 1, unsigned: true
      t.integer "field_goals_2pt_attempted", limit: 1, unsigned: true
      t.integer "rebounds_offense", limit: 1, unsigned: true
      t.integer "rebounds_defense", limit: 1, unsigned: true
      t.integer "assists", limit: 1, unsigned: true
      t.integer "fouls_made", limit: 1, unsigned: true
      t.integer "steals", limit: 1, unsigned: true
      t.integer "blocks_made", limit: 1, unsigned: true
      t.integer "turnovers", limit: 1, unsigned: true
      t.index ["game_id"], name: "fk_game_statistics_games1_idx"
      t.index ["player_id", "game_id"], name: "unique_game_player", unique: true
      t.index ["player_id"], name: "fk_game_statistics_players1_idx"
      t.index ["team_id"], name: "fk_game_statistics_teams1_idx"
    end
  
    create_table "game_urls", primary_key: ["id", "game_id"], charset: "utf8", force: :cascade do |t|
      t.integer "id", null: false, auto_increment: true
      t.integer "game_id", null: false
      t.string "url", null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "processed_at"
      t.index ["game_id"], name: "fk_game_urls_games1_idx"
      t.index ["url"], name: "url_UNIQUE", unique: true
    end
  
    create_table "games", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "season_id", null: false
      t.string "date", limit: 10, null: false
      t.integer "home_team_id", null: false
      t.integer "away_team_id", null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "home_team_points", limit: 1, default: 0, null: false, unsigned: true
      t.integer "away_team_points", limit: 1, default: 0, null: false, unsigned: true
      t.string "slug", limit: 142, null: false
      t.index ["away_team_id"], name: "fk_games_teams2_idx"
      t.index ["home_team_id"], name: "fk_games_teams1_idx"
      t.index ["season_id", "home_team_id", "away_team_id"], name: "unique_season_team1_team2", unique: true
      t.index ["season_id"], name: "fk_games_seasons1_idx"
      t.index ["slug"], name: "unique_slug", unique: true
    end
  
    create_table "migration", primary_key: "version", id: { type: :string, limit: 180 }, charset: "utf8", force: :cascade do |t|
      t.integer "apply_time"
    end
  
    create_table "nationalities", primary_key: ["player_id", "country_id"], charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.integer "country_id", null: false
      t.index ["country_id"], name: "fk_players_has_countries_country_idx"
      t.index ["player_id"], name: "fk_players_has_player_idx"
    end
  
    create_table "notes", id: { type: :binary, limit: 16 }, charset: "utf8", force: :cascade do |t|
      t.string "author", limit: 40, null: false
      t.text "description", null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "note_category_id"
      t.integer "note_subcategory_id"
      t.integer "player_id", null: false
      t.integer "user_id", null: false
      t.index ["id"], name: "id_UNIQUE", unique: true
      t.index ["note_category_id"], name: "fk_notes_notes_categories1_idx"
      t.index ["note_subcategory_id"], name: "fk_notes_notes_subcategories1_idx"
      t.index ["player_id"], name: "fk_notes_players1_idx"
      t.index ["user_id"], name: "fk_notes_user1_idx"
    end
  
    create_table "notes_categories", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 45, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
    end
  
    create_table "notes_subcategories", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 45, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "note_category_id", null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["note_category_id"], name: "fk_notes_subcategories_notes_categories1_idx"
    end
  
    create_table "photos", id: { type: :integer, unsigned: true }, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.string "source", limit: 32, null: false
      t.integer "created_at", null: false, unsigned: true
      t.integer "updated_at", null: false, unsigned: true
      t.string "md5", limit: 32, null: false
      t.string "cloud_path", limit: 120, null: false
      t.string "cloud_path_thumb", limit: 120, null: false
      t.index ["cloud_path"], name: "cloud_path_UNIQUE", unique: true
      t.index ["cloud_path_thumb"], name: "cloud_path_resize_UNIQUE", unique: true
      t.index ["md5"], name: "md5_UNIQUE", unique: true
      t.index ["player_id"], name: "player_photo_idx"
    end
  
    create_table "player_cv", primary_key: ["user_id", "player_id"], charset: "utf8", force: :cascade do |t|
      t.integer "user_id", null: false
      t.integer "player_id", null: false
      t.string "slug", limit: 6, null: false
      t.integer "created_at", null: false, unsigned: true
      t.integer "updated_at", null: false, unsigned: true
      t.string "cloud_path", limit: 120, null: false
      t.string "cloud_path_thumb", limit: 120, null: false
      t.index ["cloud_path"], name: "player_cv_cloud_path_UNIQUE", unique: true
      t.index ["cloud_path_thumb"], name: "player_cv_cloud_path_thumb_UNIQUE", unique: true
      t.index ["player_id"], name: "fk_player_cv_players1_idx"
      t.index ["slug"], name: "player_cv_slug_UNIQUE", unique: true
      t.index ["user_id"], name: "player_cv_user_id_UNIQUE", unique: true
    end
  
    create_table "player_tag_assn", primary_key: ["player_tag_id", "player_id"], charset: "utf8", force: :cascade do |t|
      t.integer "player_tag_id", null: false
      t.integer "player_id", null: false
      t.decimal "player_ord", precision: 8, scale: 4, null: false
      t.integer "created_at"
      t.integer "updated_at"
      t.index ["player_id"], name: "fk_player_tag_assn_players1_idx"
    end
  
    create_table "player_tags", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 63, null: false
      t.integer "user_id", null: false
      t.integer "created_at"
      t.integer "updated_at"
      t.integer "position"
      t.index ["name", "user_id"], name: "unique_name_user_id", unique: true
      t.index ["user_id"], name: "fk_player_tags_user1_idx"
    end
  
    create_table "player_url", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.string "url", limit: 249, null: false
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.index ["player_id"], name: "fk_player_url_players1_idx"
      t.index ["url"], name: "url_UNIQUE", unique: true
    end
  
    create_table "player_url_blacklist", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "url", null: false
      t.string "description", limit: 64
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["url"], name: "url_UNIQUE", unique: true
    end
  
    create_table "player_vs_agent", primary_key: ["player_id", "agent_id"], charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.integer "agent_id", null: false
      t.index ["agent_id"], name: "fk_players_has_agents_agents1_idx"
      t.index ["player_id"], name: "fk_players_has_agents_players1_idx"
    end
  
    create_table "player_vs_position", primary_key: ["player_id", "position_id"], charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.integer "position_id", null: false
      t.index ["player_id"], name: "fk_player_vs_position_players1_idx"
      t.index ["position_id"], name: "fk_player_vs_position_positions1_idx"
    end
  
    create_table "players", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 40, null: false
      t.string "surname", limit: 40
      t.decimal "height", precision: 3, scale: 2
      t.integer "weight"
      t.integer "birthday"
      t.integer "birthmonth"
      t.integer "birthyear", default: 0, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.string "slug", limit: 62, null: false
      t.integer "hs_year"
      t.integer "recruiter_id"
      t.string "facebook", limit: 50
      t.string "instagram", limit: 30
      t.string "twitter", limit: 16
      t.integer "hand"
      t.integer "positions_validated", default: 0, null: false
      t.integer "hs_position", limit: 2, default: 0, unsigned: true
      t.index ["facebook"], name: "facebook_UNIQUE", unique: true
      t.index ["instagram"], name: "player_instagram_UNIQUE", unique: true
      t.index ["recruiter_id"], name: "fk_players_recruiters1_idx"
      t.index ["slug"], name: "player_slug_UNIQUE", unique: true
      t.index ["twitter"], name: "player_twitter_UNIQUE", unique: true
    end
  
    create_table "players_abilities", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.string "type", limit: 16, null: false
      t.string "pro_or_con", limit: 16, null: false
      t.string "description", limit: 256, null: false
      t.index ["player_id"], name: "fk_players_abilities_players1_idx"
    end
  
    create_table "position_name", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "position_id", null: false
      t.string "name", limit: 18, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["position_id"], name: "fk_position_name_positions1_idx"
    end
  
    create_table "positions", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "abbr", limit: 2, null: false
      t.string "name", limit: 14, null: false
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.index ["abbr"], name: "abbr_UNIQUE", unique: true
      t.index ["name"], name: "name_UNIQUE", unique: true
    end
  
    create_table "predicted_positions", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.integer "primary_position_id", null: false
      t.integer "secondary_position_id", null: false
      t.string "result", limit: 128, null: false
      t.index ["id"], name: "id_UNIQUE", unique: true
      t.index ["player_id"], name: "fk_ml_positions_players1_idx"
      t.index ["player_id"], name: "player_id_UNIQUE", unique: true
      t.index ["primary_position_id"], name: "fk_ml_positions_positions1_idx"
      t.index ["secondary_position_id"], name: "fk_ml_positions_positions2_idx"
    end
  
    create_table "profile", primary_key: "user_id", id: :integer, default: nil, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.string "name"
      t.string "public_email"
      t.string "gravatar_email"
      t.string "gravatar_id", limit: 32
      t.string "location"
      t.string "website"
      t.text "bio"
      t.string "timezone", limit: 40
    end
  
    create_table "recruiters", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "name", limit: 128, null: false
      t.string "email", limit: 128, null: false
      t.string "phone", limit: 128, null: false
      t.string "slug", limit: 128, null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["email"], name: "email_UNIQUE", unique: true
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["phone"], name: "phone_UNIQUE", unique: true
      t.index ["slug"], name: "slug_UNIQUE", unique: true
    end
  
    create_table "seasons", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "competition_id", null: false
      t.integer "start", limit: 2, null: false
      t.integer "end", limit: 2
      t.integer "updated_at", null: false
      t.integer "created_at", null: false
      t.integer "enabled", limit: 1, default: 1, null: false
      t.index ["competition_id", "start"], name: "unique_competition_start_end", unique: true
      t.index ["competition_id"], name: "season_competition_idx"
    end
  
    create_table "seasons_teams", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "season_id", null: false
      t.integer "team_id", null: false
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.index ["season_id", "team_id"], name: "unique_season_id_team_id", unique: true
      t.index ["season_id"], name: "fk_seasons_teams_seasons1_idx"
      t.index ["team_id"], name: "fk_seasons_teams_teams1_idx"
    end
  
    create_table "social_account", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.integer "user_id"
      t.string "provider", null: false
      t.string "client_id", null: false
      t.text "data"
      t.string "code", limit: 32
      t.integer "created_at"
      t.string "email"
      t.string "username"
      t.index ["code"], name: "account_unique_code", unique: true
      t.index ["provider", "client_id"], name: "account_unique", unique: true
      t.index ["user_id"], name: "fk_user_account"
    end
  
    create_table "statistic_saved_search", id: :integer, charset: "utf8", force: :cascade do |t|
      t.string "md5", limit: 32, null: false
      t.text "params"
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.integer "user_id", null: false
      t.index ["user_id"], name: "fk_statistic_saved_search_user1_idx"
    end
  
    create_table "statistics", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.integer "season_id", null: false
      t.integer "team_id", null: false
      t.integer "games", limit: 1
      t.integer "seconds", limit: 3
      t.integer "points", limit: 2
      t.integer "field_goals_1pt_attempted", limit: 2
      t.integer "field_goals_1pt_made", limit: 2
      t.integer "field_goals_2pt_attempted", limit: 2
      t.integer "field_goals_2pt_made", limit: 2
      t.integer "field_goals_3pt_attempted", limit: 2
      t.integer "field_goals_3pt_made", limit: 2
      t.integer "rebounds_defense", limit: 2
      t.integer "rebounds_offense", limit: 2
      t.integer "assists", limit: 2
      t.integer "steals", limit: 2
      t.integer "turnovers", limit: 2
      t.integer "blocks_received", limit: 1
      t.integer "blocks_made", limit: 2
      t.integer "fouls_made", limit: 2
      t.integer "fouls_received", limit: 2
      t.integer "efficiency", limit: 2
      t.integer "blocks", limit: 2
      t.integer "field_goals_attempted", limit: 2
      t.integer "field_goals_made", limit: 2
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.decimal "avg_points", precision: 3, scale: 1
      t.decimal "avg_minutes", precision: 3, scale: 1
      t.decimal "avg_rebounds_defense", precision: 3, scale: 1
      t.decimal "avg_rebounds_offense", precision: 3, scale: 1
      t.decimal "avg_rebounds", precision: 3, scale: 1
      t.decimal "avg_assists", precision: 3, scale: 1
      t.decimal "avg_steals", precision: 3, scale: 1
      t.decimal "avg_turnovers", precision: 3, scale: 1
      t.decimal "avg_blocks_made", precision: 3, scale: 1
      t.decimal "avg_blocks_received", precision: 3, scale: 1
      t.decimal "avg_fouls_made", precision: 3, scale: 1
      t.decimal "avg_fouls_received", precision: 3, scale: 1
      t.decimal "avg_efficiency", precision: 3, scale: 1
      t.decimal "avg_blocks", precision: 4, scale: 2
      t.decimal "avg_field_goals_made", precision: 3, scale: 1
      t.decimal "avg_field_goals_attempted", precision: 3, scale: 1
      t.integer "minutes", limit: 2
      t.integer "rebounds", limit: 2
      t.decimal "percentage_field_goals", precision: 4, scale: 1
      t.decimal "percentage_field_goals_2pt", precision: 4, scale: 1
      t.decimal "percentage_field_goals_3pt", precision: 4, scale: 1
      t.decimal "percentage_field_goals_1pt", precision: 4, scale: 1
      t.decimal "adv_fic", precision: 4, scale: 2
      t.decimal "adv_points_per_shoot", precision: 4, scale: 2
      t.integer "adv_true_shooting_percentage", limit: 2
      t.integer "adv_total_shooting_percentage", limit: 2
      t.integer "adv_efg_percentage", limit: 2
      t.decimal "adv_fta_vs_fga", precision: 4, scale: 3
      t.decimal "adv_ast_vs_to", precision: 4, scale: 2
      t.decimal "adv_stl_vs_to", precision: 4, scale: 2
      t.integer "adv_tov_percentage", limit: 1
      t.decimal "adv_ast_stl_vs_to", precision: 5, scale: 3
      t.decimal "adv_ro_vs_rd", precision: 5, scale: 3
      t.decimal "adv_blk_vs_rt", precision: 5, scale: 3
      t.decimal "adv_blk_rd_vs_pts", precision: 5, scale: 3
      t.integer "college_class_id", limit: 1
      t.decimal "avg_field_goals_1pt_made", precision: 3, scale: 1
      t.decimal "avg_field_goals_1pt_attempted", precision: 3, scale: 1
      t.decimal "avg_field_goals_2pt_made", precision: 3, scale: 1
      t.decimal "avg_field_goals_2pt_attempted", precision: 3, scale: 1
      t.decimal "avg_field_goals_3pt_made", precision: 3, scale: 1
      t.decimal "avg_field_goals_3pt_attempted", precision: 3, scale: 1
      t.index ["college_class_id"], name: "fk_statistics_college_class1_idx"
      t.index ["created_at"], name: "index_statistics_created_at"
      t.index ["id"], name: "cod_stat"
      t.index ["player_id", "season_id", "team_id"], name: "unique_player_season", unique: true
      t.index ["player_id"], name: "fk_stats_avg_players1_idx"
      t.index ["season_id"], name: "fk_stats_avg_seasons1_idx"
      t.index ["team_id"], name: "fk_stats_avg_teams1_idx"
    end
  
    create_table "stripe_subscriptions", primary_key: "user_id", id: :integer, default: nil, charset: "utf8", force: :cascade do |t|
      t.string "customer_id", null: false
      t.string "subscription_id", null: false
      t.integer "created_at", null: false, unsigned: true
      t.integer "updated_at", null: false, unsigned: true
      t.index ["customer_id"], name: "stripe_customer_id_UNIQUE", unique: true
      t.index ["subscription_id"], name: "subscription_id_UNIQUE", unique: true
      t.index ["user_id"], name: "fk_stripe_subscriptions_user1_idx"
      t.index ["user_id"], name: "user_id_UNIQUE", unique: true
    end
  
    create_table "team_name", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "team_id", null: false
      t.string "name", limit: 70, null: false
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["team_id"], name: "fk_team_name_teams1_idx"
    end
  
    create_table "teams", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "country_id"
      t.string "twitter", limit: 16
      t.integer "created_at", null: false
      t.integer "updated_at", null: false
      t.string "image"
      t.string "name", limit: 38, null: false
      t.string "slug", limit: 62, null: false
      t.index ["country_id"], name: "fk_teams_countries1_idx"
      t.index ["name"], name: "name_UNIQUE", unique: true
      t.index ["slug"], name: "slug_UNIQUE", unique: true
    end
  
    create_table "token", id: false, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.integer "user_id", null: false
      t.string "code", limit: 32, null: false
      t.integer "created_at", null: false
      t.integer "type", limit: 2, null: false
      t.index ["user_id", "code", "type"], name: "token_unique", unique: true
    end
  
    create_table "user", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
      t.string "username", null: false
      t.string "email", null: false
      t.string "password_hash", limit: 60, null: false
      t.string "auth_key", limit: 32, null: false
      t.integer "confirmed_at_old"
      t.string "unconfirmed_email"
      t.integer "blocked_at"
      t.string "registration_ip", limit: 45
      t.integer "created_at", null: false
      t.integer "last_login_at"
      t.integer "flags", default: 0, null: false
      t.integer "updated_at", null: false
      t.datetime "confirmed_at"
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.string "confirmation_token"
      t.datetime "confirmation_sent_at"
      t.integer "failed_attempts", default: 0, null: false
      t.string "unlock_token"
      t.datetime "locked_at"
      t.index ["confirmation_token"], name: "index_user_on_confirmation_token", unique: true
      t.index ["email"], name: "index_user_on_email", unique: true
      t.index ["email"], name: "user_unique_email", unique: true
      t.index ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true
      t.index ["unlock_token"], name: "index_user_on_unlock_token", unique: true
      t.index ["username"], name: "user_unique_username", unique: true
    end
  
    create_table "users_parent_vs_child", primary_key: ["parent_id", "child_id"], charset: "utf8", force: :cascade do |t|
      t.integer "parent_id", null: false
      t.integer "child_id", null: false
      t.index ["child_id"], name: "fk_child_idx"
      t.index ["parent_id"], name: "fk_parent_idx"
    end
  
    create_table "videos", id: :integer, charset: "utf8", force: :cascade do |t|
      t.integer "player_id", null: false
      t.string "youtube", limit: 11
      t.string "color_hex", limit: 6
      t.integer "number"
      t.text "description"
      t.integer "created_at", default: 0, null: false
      t.integer "updated_at", default: 0, null: false
      t.string "cloud_path", limit: 120
      t.string "cloud_thumb", limit: 120
      t.string "cloud_sprite", limit: 120
      t.string "cloud_vtt"
      t.index ["player_id"], name: "player_video_idx"
    end
  
    # add_foreign_key "agency_data", "agencies", name: "fk_agency_data_agencies1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "agents", "agencies", name: "fk_agents_agencies1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "agents", "countries", name: "fk_agents_countries1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "alerts", "competitions", name: "fk_alerts_competitions1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "alerts", "players", name: "fk_alert_players10", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "alerts", "seasons", name: "fk_alerts_seasons1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "alerts", "teams", name: "fk_alerts_teams1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "auth_assignment", "auth_item", column: "item_name", primary_key: "name", name: "auth_assignment_ibfk_1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "auth_item", "auth_rule", column: "rule_name", primary_key: "name", name: "auth_item_ibfk_1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "auth_item_child", "auth_item", column: "child", primary_key: "name", name: "auth_item_child_ibfk_2", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "auth_item_child", "auth_item", column: "parent", primary_key: "name", name: "auth_item_child_ibfk_1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "blog_related", "blog", column: "blog_id_main", name: "fk_blog_has_blog_blog1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "blog_related", "blog", column: "blog_id_related", name: "fk_blog_has_blog_blog2", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "competition_name", "competitions", name: "fk_competition_name_competitions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "competition_rankings", "competitions", column: "competitions_id", name: "fk_competition_rankings_competitions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "competition_urls", "competitions", name: "fk_competiton_urls_competitions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "competitions", "countries", name: "fk_competitions_countries", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "country_names", "countries", name: "fk_country_names_countries1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "coupon", "user", name: "fk_coupon_user1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "distinct_players", "players", column: "player1_id", name: "fk_distinct_players_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "distinct_players", "players", column: "player2_id", name: "fk_distinct_players_players2", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "game_statistics", "games", name: "fk_game_statistics_games1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "game_statistics", "players", name: "fk_game_statistics_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "game_statistics", "teams", name: "fk_game_statistics_teams1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "game_urls", "games", name: "fk_game_urls_games1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "games", "seasons", name: "fk_games_seasons1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "games", "teams", column: "away_team_id", name: "fk_games_teams2", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "games", "teams", column: "home_team_id", name: "fk_games_teams1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "nationalities", "countries", name: "fk_players_has_countries_country1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "nationalities", "players", name: "fk_players_has_player", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "notes", "notes_categories", column: "note_category_id", name: "fk_notes_notes_categories1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "notes", "notes_subcategories", column: "note_subcategory_id", name: "fk_notes_notes_subcategories1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "notes", "players", name: "fk_notes_players1", on_update: :cascade
    # add_foreign_key "notes", "user", name: "fk_notes_user1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "notes_subcategories", "notes_categories", column: "note_category_id", name: "fk_notes_subcategories_notes_categories1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "photos", "players", name: "fk_player_photo_fk", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_cv", "players", name: "fk_player_cv_players1"
    # add_foreign_key "player_cv", "user", name: "fk_player_cv_user1"
    # add_foreign_key "player_tag_assn", "player_tags", name: "fk_player_tag_assn_player_tags1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_tag_assn", "players", name: "fk_player_tag_assn_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_tags", "user", name: "fk_player_tags_user1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_url", "players", name: "fk_player_url_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_vs_agent", "agents", name: "fk_players_has_agents_agents1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_vs_agent", "players", name: "fk_players_has_agents_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_vs_position", "players", name: "fk_player_vs_position_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "player_vs_position", "positions", name: "fk_player_vs_position_positions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "players", "recruiters", name: "fk_players_recruiters1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "players_abilities", "players", name: "fk_players_abilities_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "position_name", "positions", name: "fk_position_name_positions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "predicted_positions", "players", name: "fk_ml_positions_players1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "predicted_positions", "positions", column: "primary_position_id", name: "fk_ml_positions_positions1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "predicted_positions", "positions", column: "secondary_position_id", name: "fk_ml_positions_positions2", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "profile", "user", name: "fk_user_profile", on_delete: :cascade
    # add_foreign_key "seasons", "competitions", name: "fk_season_competition", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "seasons_teams", "seasons", name: "fk_seasons_teams_seasons1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "seasons_teams", "teams", name: "fk_seasons_teams_teams1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "social_account", "user", name: "fk_user_account", on_delete: :cascade
    # add_foreign_key "statistic_saved_search", "user", name: "fk_statistic_saved_search_user1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "statistics", "college_class", name: "fk_statistics_college_class1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "statistics", "players", name: "fk_stats_avg_players10", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "statistics", "seasons", name: "fk_stats_avg_seasons10", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "statistics", "teams", name: "fk_stats_avg_teams10", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "stripe_subscriptions", "user", name: "fk_stripe_subscriptions_user1"
    # add_foreign_key "team_name", "teams", name: "fk_team_name_teams1", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "teams", "countries", name: "fk_teams_countries1", on_update: :cascade, on_delete: :nullify
    # add_foreign_key "token", "user", name: "fk_user_token", on_delete: :cascade
    # add_foreign_key "users_parent_vs_child", "user", column: "child_id", name: "fk_child", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "users_parent_vs_child", "user", column: "parent_id", name: "fk_parent", on_update: :cascade, on_delete: :cascade
    # add_foreign_key "videos", "players", name: "fk_player_video", on_update: :cascade, on_delete: :cascade
  end
  