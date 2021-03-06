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

ActiveRecord::Schema.define(:version => 20110125130838) do

  create_table "chemical_names", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "language",    :limit => 2, :null => false
    t.integer  "chemical_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chemicals", :force => true do |t|
    t.integer  "recommended_name_id"
    t.string   "casrn"
    t.integer  "changed_by_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "room"
    t.string   "board"
    t.string   "shelf"
    t.integer  "changed_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.integer  "chemical_id"
    t.string   "size"
    t.string   "source"
    t.string   "purchase_date"
    t.date     "next_check_date"
    t.date     "expiration_date"
    t.integer  "created_by"
    t.integer  "location_id"
    t.date     "destroyed_date"
    t.text     "destroyed_reason"
    t.text     "note"
    t.string   "sign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_name"
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
