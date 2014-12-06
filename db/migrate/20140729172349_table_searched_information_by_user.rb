class TableSearchedInformationByUser < ActiveRecord::Migration
  def up
    create_table :table_searched_information_by_users do |t|
      t.integer :income_size
      t.string :income_currency
      t.string :income_source
      t.string :income_location_country
      t.string :income_location_state
      t.string :income_location_region
      t.string :income_location_area
      t.date :income_date_earned
      t.integer :income_assets_holding_period_days
      t.string :income_economic_sector
      t.string :income_specific_profession
      t.integer :table_searcher_personal_information_id
      t.integer :income_controlling_interest
      t.timestamps
    end 
    add_foreign_key(:table_searched_information_by_users, :table_searcher_personal_informations, name: 'fk_tbl_srd_inf_by_users_tbl_srd_psl_info_KEY_tbl_srd_psl_inf_id')
  end
  
 
  def down
    remove_foreign_key(:table_searched_information_by_users, name: 'fk_tbl_srd_inf_by_users_tbl_srd_psl_info_KEY_tbl_srd_psl_inf_id')
    remove_foreign_key(:table_searcher_personal_informations, name: 'fk_tbl_srd_inf_by_users_tbl_srd_psl_info_KEY_tbl_srd_psl_inf_id')
    drop_table :table_searched_information_by_users
  end
end
