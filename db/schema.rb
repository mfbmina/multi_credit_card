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

ActiveRecord::Schema.define(version: 20171024003630) do

  create_table "cards", force: :cascade do |t|
    t.string "number"
    t.date "due_date"
    t.date "exp_date"
    t.integer "cvv"
    t.decimal "real_limit", precision: 8, scale: 2, default: "0.0"
    t.decimal "decimal", precision: 8, scale: 2, default: "0.0"
    t.decimal "spent_value", precision: 8, scale: 2, default: "0.0"
    t.integer "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "float_limit", precision: 8, scale: 2, default: "0.0"
    t.index ["wallet_id"], name: "index_cards_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["authentication_token"], name: "index_users_on_authentication_token"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "limit", precision: 8, scale: 2, default: "0.0"
    t.decimal "decimal", precision: 8, scale: 2, default: "0.0"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

end
