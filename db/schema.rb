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

ActiveRecord::Schema.define(version: 20170819173849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photo"
    t.string   "page_face"
    t.string   "profile_insta"
    t.string   "city"
    t.text     "public"
    t.string   "acting"
    t.string   "color"
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "desires", force: :cascade do |t|
    t.string   "title"
    t.integer  "action"
    t.text     "description"
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "img1"
    t.string   "img2"
    t.string   "img3"
    t.text     "observation"
    t.integer  "format"
    t.index ["company_id"], name: "index_desires_on_company_id", using: :btree
    t.index ["user_id"], name: "index_desires_on_user_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.text     "message"
    t.integer  "status",     default: 0
    t.integer  "desire_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "img1"
    t.string   "img2"
    t.string   "img3"
    t.text     "note"
    t.index ["desire_id"], name: "index_proposals_on_desire_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind",                   default: 0
    t.integer  "status",                 default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "credit",                 default: 1
    t.integer  "plan"
    t.string   "phone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "companies", "users"
  add_foreign_key "desires", "companies"
  add_foreign_key "desires", "users"
  add_foreign_key "proposals", "desires"
end
