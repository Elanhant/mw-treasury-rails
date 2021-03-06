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

ActiveRecord::Schema.define(version: 20150123081616) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plugins_count", default: 0
  end

  create_table "plugin_files", force: true do |t|
    t.string   "name"
    t.integer  "plugin_id"
    t.integer  "size"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_files", ["plugin_id"], name: "index_plugin_files_on_plugin_id"

  create_table "plugin_images", force: true do |t|
    t.string   "url"
    t.integer  "plugin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_images", ["plugin_id"], name: "index_plugin_images_on_plugin_id"

  create_table "plugin_links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "plugin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_links", ["plugin_id"], name: "index_plugin_links_on_plugin_id"

  create_table "plugins", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.text     "description"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
