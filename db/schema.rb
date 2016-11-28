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

ActiveRecord::Schema.define(version: 20161128065742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.text     "why_i_run"
    t.text     "goals",               null: false
    t.string   "experience",          null: false
    t.text     "need_to_knows"
    t.integer  "user_id",             null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "runs", force: :cascade do |t|
    t.float    "distance"
    t.time     "run_time"
    t.time     "run_pace"
    t.integer  "runner_id",        null: false
    t.integer  "companion_id"
    t.string   "run_date",         null: false
    t.integer  "time",             null: false
    t.integer  "zipcode"
    t.float    "latitude",         null: false
    t.float    "longitude",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "desired_distance"
    t.index ["companion_id"], name: "index_runs_on_companion_id", using: :btree
    t.index ["runner_id"], name: "index_runs_on_runner_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "zipcode",         null: false
    t.float    "latitude",        null: false
    t.float    "longitude",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
