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

ActiveRecord::Schema.define(version: 20160124223023) do

  create_table "primary_assets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "d"
    t.integer  "i"
    t.integer  "c"
    t.integer  "t"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "primary_assets_secondary_assets", id: false, force: :cascade do |t|
    t.integer "primary_asset_id",   null: false
    t.integer "secondary_asset_id", null: false
  end

  add_index "primary_assets_secondary_assets", ["primary_asset_id", "secondary_asset_id"], name: "pa_sa_id"
  add_index "primary_assets_secondary_assets", ["secondary_asset_id", "primary_asset_id"], name: "sa_pa_id"

  create_table "secondary_assets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
