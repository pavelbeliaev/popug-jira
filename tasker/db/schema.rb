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

ActiveRecord::Schema.define(version: 2021_11_06_114116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "public_id"
    t.string "full_name", null: false
    t.string "role", null: false
    t.index ["public_id"], name: "index_accounts_on_public_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "account_id"
    t.string "description"
    t.integer "price"
    t.integer "fee"
    t.datetime "completed_at"
    t.string "status", default: "active"
    t.uuid "public_id", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_tasks_on_account_id"
    t.index ["public_id"], name: "index_tasks_on_public_id"
  end

end
