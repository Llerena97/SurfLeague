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

ActiveRecord::Schema.define(version: 2018_12_18_162702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_groups", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "category_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_groups_on_category_id"
    t.index ["group_id"], name: "index_category_groups_on_group_id"
    t.index ["tournament_id"], name: "index_category_groups_on_tournament_id"
  end

  create_table "group_participants", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_participants_on_group_id"
    t.index ["participant_id"], name: "index_group_participants_on_participant_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "Group"
    t.integer "phase", default: 1
    t.bigint "category_id"
    t.index ["category_id"], name: "index_groups_on_category_id"
    t.index ["tournament_id"], name: "index_groups_on_tournament_id"
  end

  create_table "participant_categories", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_participant_categories_on_category_id"
    t.index ["participant_id"], name: "index_participant_categories_on_participant_id"
  end

  create_table "participant_scores", force: :cascade do |t|
    t.bigint "score_id"
    t.bigint "user_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_participant_scores_on_group_id"
    t.index ["participant_id"], name: "index_participant_scores_on_participant_id"
    t.index ["score_id"], name: "index_participant_scores_on_score_id"
    t.index ["user_id"], name: "index_participant_scores_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.text "waves", default: [], array: true
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

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category_groups", "categories"
  add_foreign_key "category_groups", "groups"
  add_foreign_key "category_groups", "tournaments"
  add_foreign_key "group_participants", "groups"
  add_foreign_key "group_participants", "participants"
  add_foreign_key "groups", "tournaments"
  add_foreign_key "participant_categories", "categories"
  add_foreign_key "participant_categories", "participants"
  add_foreign_key "participant_scores", "groups"
  add_foreign_key "participant_scores", "participants"
  add_foreign_key "participant_scores", "scores"
  add_foreign_key "participant_scores", "users"
  add_foreign_key "tournament_categories", "categories"
  add_foreign_key "tournament_categories", "tournaments"
end
