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

ActiveRecord::Schema.define(version: 20161123150829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moods", force: :cascade do |t|
    t.time     "mood_pace"
    t.string   "mood_experience"
    t.float    "desired_distance"
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_moods_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "why_i_run"
    t.time     "user_pace",     null: false
    t.text     "goals",         null: false
    t.string   "experience",    null: false
    t.text     "need_to_knows"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "runs", force: :cascade do |t|
    t.float    "distance",                    null: false
    t.time     "run_time",                    null: false
    t.time     "run_pace",                    null: false
    t.integer  "user_id",                     null: false
    t.integer  "companion_id"
    t.boolean  "is_solo",      default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["companion_id"], name: "index_runs_on_companion_id", using: :btree
    t.index ["user_id"], name: "index_runs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "location",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
