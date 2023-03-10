# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_27_083606) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", force: :cascade do |t|
    t.string "line_user_id"
    t.string "line_display_name"
    t.string "line_avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_user_id"], name: "index_friends_on_line_user_id", unique: true
  end

  create_table "friends_users", force: :cascade do |t|
    t.integer "friend_id", null: false
    t.integer "user_id", null: false
    t.string "none"
    t.string "link_token"
    t.bigint "link_token_expire_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link_status"
    t.index ["friend_id"], name: "index_friends_users_on_friend_id"
    t.index ["none"], name: "index_friends_users_on_none", unique: true
    t.index ["user_id"], name: "index_friends_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friends_users", "friends"
  add_foreign_key "friends_users", "users"
end
