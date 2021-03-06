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

ActiveRecord::Schema.define(version: 20170719220908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "coins", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "coin_info"
    t.string "coin_status"
    t.decimal "price"
    t.decimal "one_day_price_change"
    t.integer "volume"
    t.bigint "market_cap"
    t.text "application_description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
    t.string "slug"
    t.string "coinmarketcap_url"
    t.bigint "available_supply"
    t.bigint "total_supply"
    t.decimal "one_hour_price_change"
    t.string "symbol"
    t.integer "link_id"
    t.integer "user_id"
    t.integer "network_id"
    t.integer "links_id"
    t.jsonb "repositories", default: {}, null: false
    t.string "code_license"
    t.string "technology"
    t.string "proof_algorithm"
    t.string "coin_type"
    t.jsonb "exchanges", default: {}, null: false
    t.datetime "saledate"
    t.text "monetary_policy"
    t.text "ico_use_of_proceeds"
    t.string "ico_pricing"
    t.string "ico_amount_sold"
    t.text "ico_allocation"
    t.text "ico_lockup"
    t.text "ico_buyer_lockup"
    t.text "ico_founder_lockup"
    t.string "ico_min_investment_cap"
    t.string "ico_type_of_min_cap"
    t.string "ico_max_investment_cap"
    t.string "ico_currency_accepted"
    t.text "ico_additional_notes"
    t.datetime "ico_planned_end_date"
    t.datetime "ico_actual_end_date"
    t.integer "capital_raised"
    t.text "ico_token_sale_structure"
    t.string "ico_type_of_max_cap"
    t.integer "coin_market_cap_id"
    t.index ["category_id"], name: "index_coins_on_category_id"
    t.index ["links_id"], name: "index_coins_on_links_id"
    t.index ["name"], name: "index_coins_on_name", unique: true
    t.index ["network_id"], name: "index_coins_on_network_id"
    t.index ["user_id"], name: "index_coins_on_user_id"
  end

  create_table "coins_links", id: false, force: :cascade do |t|
    t.integer "coin_id", null: false
    t.integer "link_id", null: false
    t.index ["coin_id", "link_id"], name: "index_coins_links_on_coin_id_and_link_id"
    t.index ["link_id", "coin_id"], name: "index_coins_links_on_link_id_and_coin_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "follows", id: :serial, force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "identities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "accesstoken"
    t.string "refreshtoken"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "nickname"
    t.string "image"
    t.string "phone"
    t.string "urls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "link"
    t.bigint "network_id"
    t.text "body"
    t.string "title"
    t.integer "user_id"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["network_id"], name: "index_links_on_network_id"
  end

  create_table "links_networks", force: :cascade do |t|
    t.bigint "network_id"
    t.bigint "link_id"
    t.index ["link_id"], name: "index_links_networks_on_link_id"
    t.index ["network_id"], name: "index_links_networks_on_network_id"
  end

  create_table "links_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "link_id", null: false
    t.index ["link_id", "user_id"], name: "index_links_users_on_link_id_and_user_id"
    t.index ["user_id", "link_id"], name: "index_links_users_on_user_id_and_link_id"
  end

  create_table "networks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.string "status"
    t.string "team"
    t.string "founders", default: [], array: true
    t.string "slack"
    t.string "forum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "logo"
    t.integer "user_id"
    t.integer "category_id"
    t.integer "coin_id"
    t.string "github"
    t.string "reddit"
    t.string "team_location"
    t.string "blockchain"
    t.index ["category_id"], name: "index_networks_on_category_id"
    t.index ["coin_id"], name: "index_networks_on_coin_id"
    t.index ["slug"], name: "index_networks_on_slug", unique: true
    t.index ["user_id"], name: "index_networks_on_user_id"
  end

  create_table "pg_search_documents", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "slug"
    t.string "stripe_customer_id"
    t.string "provider", default: "email", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "whitepapers", id: :serial, force: :cascade do |t|
    t.integer "network_id"
    t.string "whitepaper"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "whitepaper_title"
    t.string "slug"
    t.text "text"
    t.text "fulltext"
    t.integer "user_id"
    t.integer "width"
    t.integer "height"
    t.string "url"
    t.string "external_url"
  end

  add_foreign_key "coins", "categories"
  add_foreign_key "identities", "users"
  add_foreign_key "links", "networks"
  add_foreign_key "links_networks", "links"
  add_foreign_key "links_networks", "networks"
end