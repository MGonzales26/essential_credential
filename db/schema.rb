# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_31_174439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinician_locations", force: :cascade do |t|
    t.bigint "clinician_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinician_id"], name: "index_clinician_locations_on_clinician_id"
    t.index ["location_id"], name: "index_clinician_locations_on_location_id"
  end

  create_table "clinicians", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "type"
    t.date "expiration"
    t.bigint "clinician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinician_id"], name: "index_documents_on_clinician_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "practice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clinician_locations", "clinicians"
  add_foreign_key "clinician_locations", "locations"
  add_foreign_key "documents", "clinicians"
end
