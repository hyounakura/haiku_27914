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

ActiveRecord::Schema.define(version: 2020_08_22_025137) do

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "haiku_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["haiku_id"], name: "index_favorites_on_haiku_id"
    t.index ["user_id", "haiku_id"], name: "index_favorites_on_user_id_and_haiku_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "following_id", null: false
    t.bigint "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["following_id", "followed_id"], name: "index_follows_on_following_id_and_followed_id", unique: true
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "haikus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kami", null: false
    t.string "naka", null: false
    t.string "simo", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["user_id"], name: "index_haikus_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
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

  add_foreign_key "favorites", "haikus"
  add_foreign_key "favorites", "users"
  add_foreign_key "follows", "users", column: "followed_id"
  add_foreign_key "follows", "users", column: "following_id"
  add_foreign_key "haikus", "users"
end
