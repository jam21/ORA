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

ActiveRecord::Schema.define(version: 2019_09_17_113348) do

  create_table "cust_ora_areas_t", primary_key: "area_id", force: :cascade do |t|
    t.integer "plant_id", precision: 38, null: false
    t.string "area_name", limit: 25, null: false
    t.integer "parent_area_id", precision: 38
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["plant_id", "area_name", "parent_area_id"], name: "ie1c7b977be245a62a275ec5df3cc6", unique: true
  end

  create_table "cust_ora_asset_log_details_t", primary_key: "log_id", force: :cascade do |t|
    t.integer "log_header_id", precision: 38, null: false
    t.integer "asset_id", precision: 38, null: false
    t.decimal "current_value", null: false
    t.boolean "mwr_required"
    t.string "mwr_justification"
    t.string "remarks"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.index ["asset_id", "current_value"], name: "ic09a56f08e0841e4987c47bd517d7"
  end

  create_table "cust_ora_asset_log_headers_t", primary_key: "log_header_id", force: :cascade do |t|
    t.integer "area_id", precision: 38, null: false
    t.string "shift", limit: 25, null: false
    t.string "comments", limit: 2000
    t.string "comments_01", limit: 2000
    t.boolean "log_required", null: false
    t.datetime "log_date", precision: 6, null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.index ["area_id", "shift", "log_date"], name: "if9a03b0477ff7aa092a0065fc7cf2"
  end

  create_table "cust_ora_assets_t", primary_key: "asset_id", force: :cascade do |t|
    t.integer "area_id", precision: 38, null: false
    t.integer "seq_number", precision: 38
    t.string "eam_asset_number", limit: 30, null: false
    t.string "asset_tag", limit: 25, null: false
    t.string "asset_description", limit: 100
    t.decimal "min_value"
    t.decimal "max_value"
    t.string "unit_of_measure", limit: 25, null: false
    t.boolean "is_boolean"
    t.string "remarks"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["area_id", "eam_asset_number", "asset_tag", "unit_of_measure"], name: "i335b24f7079b989eb0d12bd1aab06", unique: true
  end

  create_table "cust_ora_checklists_t", primary_key: "checklist_id", force: :cascade do |t|
    t.integer "area_id", precision: 38, null: false
    t.integer "seq_number", precision: 38
    t.string "check_list_description", limit: 100, null: false
    t.decimal "min_value"
    t.decimal "max_value"
    t.string "unit_of_measure", limit: 25, null: false
    t.boolean "is_boolean"
    t.string "remarks"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["area_id", "check_list_description", "unit_of_measure"], name: "i9d762d97e9d2363d0ebde113fb9b4", unique: true
  end

  create_table "cust_ora_cklist_log_details_t", primary_key: "cklist_log_id", force: :cascade do |t|
    t.integer "cklist_log_header_id", precision: 38, null: false
    t.integer "checklist_id", precision: 38, null: false
    t.decimal "current_value", null: false
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.index ["checklist_id", "current_value"], name: "i126f74adcaea095a4095109a7f25c"
  end

  create_table "cust_ora_cklist_log_headers_t", primary_key: "cklist_log_header_id", force: :cascade do |t|
    t.integer "area_id", precision: 38, null: false
    t.string "shift", limit: 25, null: false
    t.string "comments", limit: 2000
    t.string "comments_01", limit: 2000
    t.boolean "checklist_required", null: false
    t.datetime "checklist_date", precision: 6, null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.index ["area_id", "shift", "checklist_date"], name: "if76e57b886e9def14fe42d280ead9"
  end

  create_table "cust_ora_locations_t", primary_key: "location_id", force: :cascade do |t|
    t.string "location_name", limit: 25, null: false
    t.string "location_description"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["location_name"], name: "i_cus_ora_loc_t_loc_nam", unique: true
  end

  create_table "cust_ora_nfc_tags_t", primary_key: "nfc_tag_id", force: :cascade do |t|
    t.integer "area_id", precision: 38, null: false
    t.string "nfc_tag_value", limit: 100, null: false
    t.datetime "nfc_tag_expiry", precision: 6
    t.integer "nfc_tag_type", precision: 38, null: false
    t.string "remarks"
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["area_id", "nfc_tag_value", "nfc_tag_type"], name: "i434aeb8309efcab005873c87fe869", unique: true
  end

  create_table "cust_ora_plants_t", primary_key: "plant_id", force: :cascade do |t|
    t.integer "location_id", precision: 38, null: false
    t.string "plant_name", limit: 25, null: false
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["location_id", "plant_name"], name: "i_cus_ora_pla_t_loc_id_pla_nam", unique: true
  end

  create_table "cust_ora_users_t", primary_key: "user_id", force: :cascade do |t|
    t.string "user_name", limit: 25, null: false
    t.integer "user_pin", precision: 38
    t.integer "location_id", precision: 38, null: false
    t.integer "plant_id", precision: 38
    t.integer "created_by", precision: 38
    t.datetime "creation_date", precision: 6
    t.integer "last_updated_by", precision: 38
    t.datetime "last_update_date", precision: 6
    t.integer "last_update_login", precision: 38
    t.datetime "end_date", precision: 6
    t.index ["user_name", "location_id"], name: "i_cus_ora_use_t_use_nam_loc_id", unique: true
  end

end
