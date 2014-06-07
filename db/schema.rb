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

ActiveRecord::Schema.define(version: 20140607030906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "order",       default: 1
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.datetime "published_at"
    t.text     "body"
    t.boolean  "is_featured",  default: false
    t.integer  "category_id"
    t.datetime "expired_at"
    t.boolean  "is_vacancy",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "raw_text"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "full_name"
    t.string   "oauth_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["oauth_token"], name: "index_users_on_oauth_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
