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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120810111311) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bible_id"
    t.text     "guide"
    t.string   "title_en"
    t.text     "guide_en"
  end

  add_index "categories", ["user_id", "created_at"], :name => "index_categories_on_user_id_and_created_at"

  create_table "devotionposts", :force => true do |t|
    t.string   "title"
    t.string   "address"
    t.text     "content"
    t.text     "application"
    t.integer  "bible_id"
    t.integer  "category_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "intro"
    t.string   "title_en"
    t.string   "address_en"
    t.text     "content_en"
    t.text     "application_en"
    t.text     "intro_en"
  end

  add_index "devotionposts", ["category_id"], :name => "index_devotionposts_on_category_id"

  create_table "rapns_apps", :force => true do |t|
    t.string   "key",                        :null => false
    t.string   "environment",                :null => false
    t.text     "certificate",                :null => false
    t.string   "password"
    t.integer  "connections", :default => 1, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "rapns_feedback", :force => true do |t|
    t.string   "device_token", :limit => 64, :null => false
    t.datetime "failed_at",                  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "app"
  end

  add_index "rapns_feedback", ["device_token"], :name => "index_rapns_feedback_on_device_token"

  create_table "rapns_notifications", :force => true do |t|
    t.integer  "badge"
    t.string   "device_token",          :limit => 64,                       :null => false
    t.string   "sound",                               :default => "1.aiff"
    t.string   "alert"
    t.text     "attributes_for_device"
    t.integer  "expiry",                              :default => 86400,    :null => false
    t.boolean  "delivered",                           :default => false,    :null => false
    t.datetime "delivered_at"
    t.boolean  "failed",                              :default => false,    :null => false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.string   "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.boolean  "alert_is_json",                       :default => false
    t.string   "app"
  end

  add_index "rapns_notifications", ["delivered", "failed", "deliver_after"], :name => "index_rapns_notifications_on_delivered_failed_deliver_after"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
