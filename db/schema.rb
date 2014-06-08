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

ActiveRecord::Schema.define(version: 20140608183404) do

  create_table "beer_types", force: true do |t|
    t.string   "name"
    t.string   "asd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beers", force: true do |t|
    t.integer  "brewery_id"
    t.integer  "beer_type_id"
    t.string   "name"
    t.float    "abv"
    t.integer  "ibu"
    t.integer  "ebc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "systembolaget"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "breweries", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "nationality"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "homepage"
    t.string   "established"
  end

  create_table "brewery_contacts", force: true do |t|
    t.string   "brewery_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brewery_id"
    t.integer  "contact_type_id"
  end

  create_table "contact_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logged_beer_evaluations", force: true do |t|
    t.integer  "logged_beer_id"
    t.integer  "body"
    t.integer  "linger"
    t.integer  "bitter"
    t.integer  "sour"
    t.integer  "sweet"
    t.integer  "fruity"
    t.integer  "floral"
    t.integer  "hoppy"
    t.integer  "spicy"
    t.integer  "malty"
    t.integer  "toffee"
    t.integer  "burnt"
    t.integer  "chocolate"
    t.integer  "sulphury"
    t.integer  "carbonation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logged_beer_evaluations", ["logged_beer_id"], name: "index_logged_beer_evaluations_on_logged_beer_id"

  create_table "logged_beer_scores", force: true do |t|
    t.integer  "logged_beer_id"
    t.integer  "appearance"
    t.integer  "aroma"
    t.integer  "pallate"
    t.integer  "flavour"
    t.integer  "overall"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logged_beer_scores", ["logged_beer_id"], name: "index_logged_beer_scores_on_logged_beer_id"

  create_table "logged_beers", force: true do |t|
    t.integer  "beer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logged_beers", ["beer_id", "user_id"], name: "index_logged_beers_on_beer_id_and_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
