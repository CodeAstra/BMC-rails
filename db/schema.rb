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

ActiveRecord::Schema.define(version: 20150802064504) do

  create_table "chart_versions", force: :cascade do |t|
    t.integer  "chart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "counter"
    t.string   "title"
    t.text     "description"
    t.text     "customer_segments"
    t.text     "value_propositions"
    t.text     "customer_relationships"
    t.text     "channels"
    t.text     "key_activities"
    t.text     "key_resources"
    t.text     "key_partnerships"
    t.text     "cost_structure"
    t.text     "revenue_streams"
  end

  add_index "chart_versions", ["chart_id"], name: "index_chart_versions_on_chart_id"

  create_table "charts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "customer_segments"
    t.text     "value_propositions"
    t.text     "customer_relationships"
    t.text     "channels"
    t.text     "key_activities"
    t.text     "key_resources"
    t.text     "key_partnerships"
    t.text     "cost_structure"
    t.text     "revenue_streams"
    t.integer  "owner_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "charts", ["owner_id"], name: "index_charts_on_owner_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

end
