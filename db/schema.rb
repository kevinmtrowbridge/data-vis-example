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

ActiveRecord::Schema.define(version: 20160617222639) do

  create_table "data_source_accounts", force: :cascade do |t|
    t.string   "password"
    t.integer  "data_source_id"
    t.integer  "user_id"
    t.integer  "workspace_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "data_sources", force: :cascade do |t|
    t.string   "name"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.integer  "data_source_id"
    t.integer  "hdfs_data_source_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "hdfs_data_source_connection_parameters_sets", force: :cascade do |t|
    t.string   "connection_parameters"
    t.integer  "hdfs_data_source_id"
    t.integer  "user_id"
    t.integer  "workspace_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "hdfs_data_sources", force: :cascade do |t|
    t.string   "name"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workspace_data_sources", force: :cascade do |t|
    t.integer  "polymorphic_data_source_id"
    t.string   "polymorphic_data_source_type"
    t.integer  "workspace_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "workspace_datasets", force: :cascade do |t|
    t.integer  "dataset_id"
    t.integer  "workspace_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "workspaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
