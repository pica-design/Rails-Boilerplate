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

ActiveRecord::Schema.define(version: 20160217210918) do

  create_table "attachments", force: :cascade do |t|
    t.text     "meta",           limit: 65535
    t.integer  "user_id",        limit: 4,     default: 1, null: false
    t.text     "content",        limit: 65535
    t.text     "filter_content", limit: 65535
    t.string   "password",       limit: 255
    t.text     "title",          limit: 65535
    t.text     "excerpt",        limit: 65535
    t.string   "status",         limit: 255,               null: false
    t.integer  "parent",         limit: 4,                 null: false
    t.string   "guid",           limit: 255
    t.integer  "menu_order",     limit: 4,                 null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.text     "guid",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.text     "items",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,     default: 1, null: false
    t.text     "content",        limit: 65535
    t.text     "filter_content", limit: 65535
    t.string   "password",       limit: 255
    t.text     "title",          limit: 65535
    t.text     "excerpt",        limit: 65535
    t.string   "status",         limit: 255,               null: false
    t.integer  "parent",         limit: 4,                 null: false
    t.string   "guid",           limit: 255
    t.integer  "menu_order",     limit: 4,                 null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "pages", ["guid"], name: "index_pages_on_guid", unique: true, using: :btree
  add_index "pages", ["menu_order"], name: "index_pages_on_menu_order", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "content",    limit: 65535
    t.text     "title",      limit: 65535
    t.text     "excerpt",    limit: 65535
    t.string   "status",     limit: 255,   null: false
    t.integer  "parent",     limit: 4,     null: false
    t.string   "guid",       limit: 255
    t.integer  "menu_order", limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["guid"], name: "index_posts_on_guid", unique: true, using: :btree
  add_index "posts", ["menu_order"], name: "index_posts_on_menu_order", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",         limit: 255,   null: false
    t.string   "slug",         limit: 255,   null: false
    t.text     "capabilities", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "site_settings", force: :cascade do |t|
    t.string   "option_name",  limit: 255
    t.text     "option_value", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_meta", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "value",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "user_meta", ["user_id"], name: "index_user_meta_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "user_meta", "users"
end
