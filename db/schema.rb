# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170204033248) do

  create_table "objective_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.string   "description",         limit: 255
    t.text     "notes",               limit: 65535
    t.integer  "parent_id",           limit: 4
    t.integer  "position",            limit: 4
    t.integer  "subject_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "number",              limit: 255
    t.integer  "objective_status_id", limit: 4
    t.integer  "project_id",          limit: 4
  end

  add_index "objectives", ["objective_status_id"], name: "index_tickets_on_status_id", using: :btree
  add_index "objectives", ["project_id"], name: "index_tickets_on_project_id", using: :btree
  add_index "objectives", ["subject_id"], name: "index_tickets_on_subject_id", using: :btree

  create_table "project_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "number",           limit: 255
    t.integer  "project_state_id", limit: 4
    t.integer  "project_type_id",  limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "notes",            limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "description",      limit: 255
  end

  add_index "projects", ["project_state_id"], name: "index_projects_on_project_state_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "objectives", "subjects"
end
