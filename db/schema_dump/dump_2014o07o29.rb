#Current version
Sequel.migration do
  change do
    create_table(:LookUp_scope_of_tax) do
      column :scope_of_tax, "varchar(45)", :null=>false
      
      primary_key [:scope_of_tax]
    end
    
    create_table(:LookUp_time_requirement_of_tax) do
      column :time_requirement, "varchar(45)", :null=>false
      column :holding_period, "int(11)", :null=>false
      column :measurement_of_holding_period, "varchar(45)", :null=>false
      
      primary_key [:time_requirement, :holding_period]
    end
    
    create_table(:Store_personal_information) do
      primary_key :id_person_search, :type=>"int(11)"
      column :residence, "varchar(255)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
    end
    
    create_table(:Table_allowance_rates) do
      primary_key :id_allowance, :type=>"int(11)"
      column :allowance_type, "varchar(45)"
      column :start, "varchar(45)"
      column :currency, "varchar(45)"
    end
    
    create_table(:Table_allowance_requirements) do
      primary_key :id_allowance_requirements, :type=>"int(11)"
    end
    
    create_table(:Table_tax_jurisdiction) do
      column :id_tax_jurisdiction, "int(11)", :null=>false
      column :name_tax_jurisdiction, "varchar(45)", :null=>false
      
      primary_key [:id_tax_jurisdiction, :name_tax_jurisdiction]
      
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_tax_jdn_2_Tbl_tax_jdn_countries_KEY_id_tax_jurisdiction
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_tax_jurisdictions) do
      column :id_tax_jurisdiction, "int(11)", :null=>false
      column :name_tax_jurisdiction, "varchar(45)", :null=>false
      
      primary_key [:id_tax_jurisdiction, :name_tax_jurisdiction]
      
      index [:id_tax_jurisdiction], :name=>:fk_tax_juridisction_idx
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_tax_levies) do
      primary_key :id_tax_levies, :type=>"int(11)"
      column :tax_levy, "int(11)", :null=>false
      column :way_of_tax_levy, "varchar(45)", :null=>false
      column :start_of_tax_levy, "varchar(45)", :null=>false
      column :currency, "varchar(45)", :null=>false
    end
    
    create_table(:Table_type_of_allowance) do
      primary_key :id_type_of_allowance, :type=>"int(11)"
      column :types_of_allowance, "varchar(45)"
      column :scope_of_allowance, "varchar(45)"
    end
    
    create_table(:Table_type_of_economic_activity) do
      column :type_of_economic_activity, "varchar(45)", :null=>false
      column :type_of_economic_sector, "varchar(45)", :null=>false
      
      primary_key [:type_of_economic_activity, :type_of_economic_sector]
    end
    
    create_table(:table_store_tax_calculation_personal_infos) do
      primary_key :id, :type=>"int(11)"
      column :id_tax_calculation_personal_info, "int(11)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
    end
    
    create_table(:Link_tax_jurisdiction_allowance_type) do
      foreign_key :id_allowance, :Table_allowance_rates, :type=>"int(11)", :null=>false, :key=>[:id_allowance]
      foreign_key :id_type_of_allowance, :Table_type_of_allowance, :type=>"int(11)", :null=>false, :key=>[:id_type_of_allowance]
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :type=>"int(11)", :null=>false, :key=>[:id_tax_jurisdiction]
      foreign_key :id_allowance_requirements, :Table_allowance_requirements, :type=>"int(11)", :null=>false, :key=>[:id_allowance_requirements]
      
      primary_key [:id_allowance, :id_type_of_allowance, :id_tax_jurisdiction, :id_allowance_requirements]
      
      index [:id_type_of_allowance], :name=>:fk_1_LK_tax_jdn_awc_tp_2_Tbl_tp_of_awc_KEY_id_type_of_allowance
      index [:id_allowance], :name=>:fk_1_LK_tax_jdn_awc_type_2_Tbl_awc_rates_KEY_id_allowance
      index [:id_tax_jurisdiction], :name=>:fk_1_LK_tax_jdn_awc_type_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
      index [:id_allowance_requirements], :name=>:fk_1_LK_tx_jdn_awc_tp_2_Tbl_awc_rqt_KEY_id_allowance_rqt
    end
    
    create_table(:Table_allowance_residency_rules) do
      primary_key :id_allowance_requirements, :type=>"int(11)", :table=>:Table_allowance_requirements, :key=>[:id_allowance_requirements]
      column :Number_of_days, "int(11)"
      column :Property_rules, "varchar(45)"
      
      index [:id_allowance_requirements], :name=>:fk_1_Tbl_awc_rdc_rules_2_Tbl_awc_rqt_KEY_id_allowance_rqt
      index [:id_allowance_requirements], :name=>:id_tax_juridiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_allowance_wealth_requirements) do
      primary_key :id_allowance_requirements, :type=>"int(11)", :table=>:Table_allowance_requirements, :key=>[:id_allowance_requirements]
      column :wealth_requirements, "varchar(45)"
      
      index [:id_allowance_requirements], :name=>:fk_1_Tbl_awc_wth_rqt_2_Tbl_awc_rqt_KEY_id_allowance_requirements
    end
    
    create_table(:Table_financial_year) do
      foreign_key :id_tax_levies, :Table_tax_levies, :type=>"int(11)", :null=>false, :key=>[:id_tax_levies]
      column :financial_year_start, "date", :null=>false
      column :financial_year_stop, "date", :null=>false
      column :payment_date, "date"
      
      primary_key [:id_tax_levies, :financial_year_start, :financial_year_stop]
      
      index [:id_tax_levies], :name=>:fk_1_Table_financial_year_2_Table_tax_levies_KEY_id_tax_levies
    end
    
    create_table(:Table_financial_year_allowance) do
      foreign_key :id_type_of_allowance, :Table_type_of_allowance, :type=>"int(11)", :null=>false, :key=>[:id_type_of_allowance]
      column :financial_year_start, "date", :null=>false
      column :financial_year_stop, "date", :null=>false
      
      primary_key [:id_type_of_allowance, :financial_year_start, :financial_year_stop]
      
      index [:id_type_of_allowance], :name=>:fk_1_Tbl_fcl_year_awc_2_Tbl_tp_of_awc_KEY_id_type_of_allowance
    end
    
    create_table(:Table_parties_to_a_DTT) do
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :type=>"int(11)", :null=>false, :key=>[:id_tax_jurisdiction]
      column :Grouping_for_a_DTT, "varchar(45)", :null=>false
      
      primary_key [:id_tax_jurisdiction, :Grouping_for_a_DTT]
      
      index [:Grouping_for_a_DTT], :name=>:Grouping_for_a_DTT_UNIQUE, :unique=>true
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_parties_to_a_DTT_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
    end
    
    create_table(:Table_searched_information_by_users) do
      column :id_searched_info, "int(11)", :null=>false
      column :residence, "varchar(45)"
      column :size_of_income, "varchar(45)"
      column :source_of_income, "varchar(45)"
      column :location, "varchar(45)"
      foreign_key :id_person_search, :Store_personal_information, :type=>"int(11)", :null=>false, :key=>[:id_person_search]
      
      primary_key [:id_searched_info, :id_person_search]
      
      index [:id_person_search], :name=>:fk_1_Tbl_srd_info_by_users_2_Store_psl_info_key_id_person_search
    end
    
    create_table(:Table_tax_jurisdiction_countries) do
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :type=>"int(11)", :null=>false, :key=>[:id_tax_jurisdiction]
      column :name_country, "varchar(45)", :null=>false
      
      primary_key [:id_tax_jurisdiction, :name_country]
      
      index [:name_country], :name=>:Secondary
    end
    
    create_table(:Table_type_of_tax) do
      primary_key :id_type_of_tax, :type=>"int(11)"
      column :types_of_taxes, "varchar(45)", :null=>false
      foreign_key :scope_of_tax, :LookUp_scope_of_tax, :type=>"varchar(45)", :null=>false, :key=>[:scope_of_tax]
      foreign_key :time_requirement, :LookUp_time_requirement_of_tax, :type=>"varchar(45)", :null=>false, :key=>[:time_requirement]
      
      index [:scope_of_tax], :name=>:fk_1_Tbl_type_of_tax_2_LUp_scope_of_tax_KEY_scope_of_tax
      index [:time_requirement], :name=>:fk_1_Tbl_type_of_tax_2_LUp_time_rqt_of_tax_KEY_time_requirements
    end
    
    create_table(:Link_DTT_tax_type_tax_levies) do
      foreign_key :id_tax_levies, :Table_tax_levies, :type=>"int(11)", :null=>false, :key=>[:id_tax_levies]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :type=>"int(11)", :null=>false, :key=>[:id_type_of_tax]
      foreign_key :Grouping_for_a_DTT, :Table_parties_to_a_DTT, :type=>"varchar(45)", :null=>false, :key=>[:Grouping_for_a_DTT]
      
      primary_key [:id_tax_levies, :id_type_of_tax, :Grouping_for_a_DTT]
      
      index [:id_tax_levies], :name=>:fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tax_lvs_KEY_id_tax_levies
      index [:id_type_of_tax], :name=>:fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tp_of_tax_KEY_id_type_of_tax
      index [:Grouping_for_a_DTT], :name=>:fk_1_LK_DTT_tx_tp_tx_lvs_2_Tbl_Pts_to_a_DTT_KEY_Gpg_for_a_DTT
    end
    
    create_table(:Link_Tax_jurisdiction_Tax_levies_Type_of_tax) do
      foreign_key :id_tax_juridiction, :Table_tax_jurisdiction, :type=>"int(11)", :null=>false, :key=>[:id_tax_jurisdiction]
      foreign_key :id_tax_levies, :Table_tax_levies, :type=>"int(11)", :null=>false, :key=>[:id_tax_levies]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :type=>"int(11)", :null=>false, :key=>[:id_type_of_tax]
      
      primary_key [:id_tax_juridiction, :id_tax_levies, :id_type_of_tax]
      
      index [:id_type_of_tax], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tp_of_tx_KEY_id_tp_of_tax
      index [:id_tax_juridiction], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_jdn_KEY_id_tax_jdn
      index [:id_tax_levies], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_lvs_KEY_id_tax_levies
    end
    
    create_table(:Link_type_of_tax_and_economic_activity) do
      foreign_key :type_of_economic_activity, :Table_type_of_economic_activity, :type=>"varchar(45)", :null=>false, :key=>[:type_of_economic_activity]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :type=>"int(11)", :null=>false, :key=>[:id_type_of_tax]
      
      primary_key [:type_of_economic_activity, :id_type_of_tax]
      
      index [:type_of_economic_activity], :name=>:fk_1_LK_tp_f_tx_and_enc_avy_2_Tbl_tp_f_enc_avy_KEY_tp_of_enc_avy
      index [:id_type_of_tax], :name=>:fk_1_LK_tp_of_tax_and_enc_avy_2_Tbl_tp_of_tax_KEY_id_type_of_tax
    end
    
    create_table(:Table_tax_jurisdiction_region) do
      foreign_key :name_country, :Table_tax_jurisdiction_countries, :type=>"varchar(45)", :null=>false, :key=>[:name_country]
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :type=>"int(11)", :null=>false, :key=>[:id_tax_jurisdiction]
      column :id_region, "int(11)", :null=>false
      column :name_region, "varchar(45)", :null=>false
      
      primary_key [:name_country, :id_tax_jurisdiction]
      
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
      index [:name_country], :name=>:fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_countries_KEY_name_country
    end
  end
end
