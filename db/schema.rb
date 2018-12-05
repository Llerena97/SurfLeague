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

ActiveRecord::Schema.define(version: 2018_12_03_145825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participant_categories", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_participant_categories_on_category_id"
    t.index ["participant_id"], name: "index_participant_categories_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_categories", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "participants_per_group"
    t.index ["category_id"], name: "index_tournament_categories_on_category_id"
    t.index ["tournament_id"], name: "index_tournament_categories_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.date "initial_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "participant_categories", "categories"
  add_foreign_key "participant_categories", "participants"
  add_foreign_key "tournament_categories", "categories"
  add_foreign_key "tournament_categories", "tournaments"
end
