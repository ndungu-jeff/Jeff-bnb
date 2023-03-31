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

ActiveRecord::Schema[7.0].define(version: 2023_03_27_155059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_houses", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "client_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_houses_on_client_id"
    t.index ["house_id"], name: "index_client_houses_on_house_id"
    t.index ["owner_id"], name: "index_client_houses_on_owner_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "password_digest"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "location"
    t.string "description"
    t.integer "price"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_houses_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_houses", "clients"
  add_foreign_key "client_houses", "houses"
  add_foreign_key "client_houses", "owners"
  add_foreign_key "houses", "owners"
end
