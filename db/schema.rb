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

ActiveRecord::Schema.define(version: 20140819205234) do

  create_table "table_answer_to_information_txc", force: true do |t|
    t.integer  "table_searched_information_by_user_id"
    t.integer  "table_searcher_personal_information_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "table_answer_to_information_txc", ["table_searched_information_by_user_id"], name: "fk_tbl_ans_to_inf_txc_tbl_srd_inf_by_urs_K_tbl_srd_inf_by_urs_id", using: :btree
  add_index "table_answer_to_information_txc", ["table_searcher_personal_information_id"], name: "fk_1_tbl_ans_to_inf_txc_2_tbl_srd_psl_inf_KEY_tbl_srd_psl_inf_id", using: :btree

  create_table "table_detailed_answer_to_information_txc", force: true do |t|
    t.integer  "table_answer_to_information_txc_id"
    t.string   "tax_name"
    t.string   "tax_jurisdiction"
    t.integer  "tax_liability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "table_detailed_answer_to_information_txc", ["table_answer_to_information_txc_id"], name: "fk_1t_dtd_ans_to_inf_txc_2t_ans_to_inf_txc_K_t_ans_to_inf_txc_id", using: :btree

  create_table "table_searched_information_by_users", force: true do |t|
    t.integer  "income_size"
    t.string   "income_currency"
    t.string   "income_source"
    t.string   "income_location_country"
    t.string   "income_location_state"
    t.string   "income_location_region"
    t.string   "income_location_area"
    t.date     "income_date_earned"
    t.integer  "income_assets_holding_period_days"
    t.string   "income_economic_sector"
    t.string   "income_specific_profession"
    t.integer  "table_searcher_personal_information_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "table_searched_information_by_users", ["table_searcher_personal_information_id"], name: "fk_tbl_srd_inf_by_users_tbl_srd_psl_info_KEY_tbl_srd_psl_inf_id", using: :btree

  create_table "table_searcher_personal_informations", force: true do |t|
    t.string   "residence_country"
    t.string   "residence_state"
    t.string   "residence_region"
    t.string   "residence_area"
    t.string   "citizenship"
    t.string   "marital_status"
    t.date     "birthday"
    t.integer  "number_of_children"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "table_answer_to_information_txc", "table_searched_information_by_users", name: "fk_tbl_ans_to_inf_txc_tbl_srd_inf_by_urs_K_tbl_srd_inf_by_urs_id"
  add_foreign_key "table_answer_to_information_txc", "table_searcher_personal_informations", name: "fk_1_tbl_ans_to_inf_txc_2_tbl_srd_psl_inf_KEY_tbl_srd_psl_inf_id"

  add_foreign_key "table_detailed_answer_to_information_txc", "table_answer_to_information_txc", name: "fk_1t_dtd_ans_to_inf_txc_2t_ans_to_inf_txc_K_t_ans_to_inf_txc_id"

  add_foreign_key "table_searched_information_by_users", "table_searcher_personal_informations", name: "fk_tbl_srd_inf_by_users_tbl_srd_psl_info_KEY_tbl_srd_psl_inf_id"

end
