#Current Schema:
Sequel.migration do
  change do
    create_table(:LookUp_scope_of_tax) do
      String :scope_of_tax, :size=>45, :null=>false
      
      primary_key [:scope_of_tax]
    end
    
    create_table(:LookUp_time_requirement_of_tax) do
      String :time_requirement, :size=>45, :null=>false
      Integer :holding_period, :null=>false
      String :measurement_of_holding_period, :size=>45, :null=>false
      
      primary_key [:time_requirement, :holding_period]
    end
    
    create_table(:Table_age_category) do
      primary_key :id_age
      Integer :age_start, :null=>false
      Integer :age_stop, :null=>false
      Date :birth_date, :null=>false
    end
    
    create_table(:Table_allowance_requirements) do
      primary_key :id_allowance_requirements
    end
    
    create_table(:Table_currency) do
      primary_key :id_currency
      String :name_currency, :size=>45, :null=>false
    end
    
    create_table(:Table_marital_status) do
      Integer :id_maritas_status, :null=>false
      String :name_marital_status, :size=>45, :null=>false
      
      primary_key [:id_maritas_status, :name_marital_status]
    end
    
    create_table(:Table_tax_jurisdiction, :ignore_index_errors=>true) do
      primary_key :id_tax_jurisdiction
      String :jurisdiction_used, :default=>"Y", :size=>1, :null=>false
      
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_tax_jdn_2_Tbl_tax_jdn_countries_KEY_id_tax_jurisdiction
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_type_of_allowance) do
      primary_key :id_type_of_allowance
      String :types_of_allowance, :size=>45
      String :scope_of_allowance, :size=>45
    end
    
    create_table(:Table_type_of_economic_activity, :ignore_index_errors=>true) do
      Integer :id_type_of_economic_activity, :null=>false
      String :name_type_of_economic_activity, :size=>45, :null=>false
      
      primary_key [:id_type_of_economic_activity, :name_type_of_economic_activity]
      
      index [:id_type_of_economic_activity], :name=>:id_type_of_economic_activity_UNIQUE, :unique=>true
    end
    
    create_table(:Table_type_of_economic_profession, :ignore_index_errors=>true) do
      Integer :id_type_of_economic_profession, :null=>false
      String :name_type_of_economic_profession, :size=>45, :null=>false
      
      primary_key [:id_type_of_economic_profession, :name_type_of_economic_profession]
      
      index [:id_type_of_economic_profession], :name=>:id_type_of_economic_profession_UNIQUE, :unique=>true
    end
    
    create_table(:Table_type_of_economic_sector, :ignore_index_errors=>true) do
      Integer :id_type_of_economic_sector, :null=>false
      String :name_type_of_economic_sector, :size=>45, :null=>false
      
      primary_key [:id_type_of_economic_sector, :name_type_of_economic_sector]
      
      index [:name_type_of_economic_sector], :name=>:type_of_economic_sector_UNIQUE, :unique=>true
    end
    
    create_table(:Table_allowance_rates, :ignore_index_errors=>true) do
      Integer :id_allowance, :null=>false
      String :allowance_type, :size=>45
      String :start, :size=>45
      foreign_key :id_currency, :Table_currency, :null=>false, :key=>[:id_currency]
      
      primary_key [:id_allowance, :id_currency]
      
      index [:id_currency], :name=>:fk_1_Tbl_awc_rates_2_Tbl_currency_KEY_id_currency_idx
    end
    
    create_table(:Table_allowance_residency_rules, :ignore_index_errors=>true) do
      primary_key :id_allowance_requirements, :table=>:Table_allowance_requirements, :key=>[:id_allowance_requirements]
      Integer :Number_of_days
      String :Property_rules, :size=>45
      
      index [:id_allowance_requirements], :name=>:fk_1_Tbl_awc_rdc_rules_2_Tbl_awc_rqt_KEY_id_allowance_rqt
      index [:id_allowance_requirements], :name=>:id_tax_juridiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_allowance_wealth_requirements, :ignore_index_errors=>true) do
      primary_key :id_allowance_requirements, :table=>:Table_allowance_requirements, :key=>[:id_allowance_requirements]
      String :wealth_requirements, :size=>45
      
      index [:id_allowance_requirements], :name=>:fk_1_Tbl_awc_wth_rqt_2_Tbl_awc_rqt_KEY_id_allowance_requirements
    end
    
    create_table(:Table_financial_year_allowance, :ignore_index_errors=>true) do
      foreign_key :id_type_of_allowance, :Table_type_of_allowance, :null=>false, :key=>[:id_type_of_allowance]
      Date :financial_year_start, :null=>false
      Date :financial_year_stop, :null=>false
      
      primary_key [:id_type_of_allowance, :financial_year_start, :financial_year_stop]
      
      index [:id_type_of_allowance], :name=>:fk_1_Tbl_fcl_year_awc_2_Tbl_tp_of_awc_KEY_id_type_of_allowance
    end
    
    create_table(:Table_parties_to_a_DTT, :ignore_index_errors=>true) do
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      String :Grouping_for_a_DTT, :size=>45, :null=>false
      Integer :id_DTT, :null=>false
      String :Grouping_for_a_DTT_date, :size=>45, :null=>false
      String :Special_name_DTT, :size=>45, :null=>false
      
      primary_key [:id_tax_jurisdiction, :id_DTT]
      
      index [:Grouping_for_a_DTT], :name=>:Grouping_for_a_DTT_UNIQUE, :unique=>true
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_parties_to_a_DTT_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
      index [:id_DTT], :name=>:index_id_DTT
    end
    
    create_table(:Table_tax_jurisdiction_country, :ignore_index_errors=>true) do
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      String :abbreviation_country, :size=>45, :null=>false
      String :name_country, :size=>45, :null=>false
      
      primary_key [:id_tax_jurisdiction, :abbreviation_country]
      
      index [:abbreviation_country], :name=>:Secondary
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_tax_levies, :ignore_index_errors=>true) do
      Integer :id_tax_levies, :null=>false
      Integer :tax_levy_level, :null=>false
      String :way_of_tax_levy, :size=>45, :null=>false
      String :start_of_tax_levy, :size=>45, :null=>false
      String :end_of_tax_levy, :size=>45, :null=>false
      foreign_key :id_currency, :Table_currency, :null=>false, :key=>[:id_currency]
      
      primary_key [:id_tax_levies, :id_currency]
      
      index [:id_currency], :name=>:fk_1_Tbl_tax_levies_2_Tbl_currency_KEY_id_tax_levies_idx
    end
    
    create_table(:Table_type_of_tax, :ignore_index_errors=>true) do
      primary_key :id_type_of_tax
      String :types_of_taxes, :size=>45, :null=>false
      foreign_key :scope_of_tax, :LookUp_scope_of_tax, :type=>String, :size=>45, :null=>false, :key=>[:scope_of_tax]
      foreign_key :time_requirement, :LookUp_time_requirement_of_tax, :type=>String, :size=>45, :null=>false, :key=>[:time_requirement]
      
      index [:scope_of_tax], :name=>:fk_1_Tbl_type_of_tax_2_LUp_scope_of_tax_KEY_scope_of_tax
      index [:time_requirement], :name=>:fk_1_Tbl_type_of_tax_2_LUp_time_rqt_of_tax_KEY_time_requirements
    end
    
    create_table(:Link_DTT_tax_type_tax_levies, :ignore_index_errors=>true) do
      foreign_key :id_tax_levies, :Table_tax_levies, :null=>false, :key=>[:id_tax_levies]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      foreign_key :id_DTT, :Table_parties_to_a_DTT, :null=>false, :key=>[:id_DTT]
      
      primary_key [:id_tax_levies, :id_type_of_tax, :id_DTT]
      
      index [:id_tax_levies], :name=>:fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tax_lvs_KEY_id_tax_levies
      index [:id_type_of_tax], :name=>:fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tp_of_tax_KEY_id_type_of_tax
      index [:id_DTT], :name=>:fk_1_LK_DTT_tx_tp_tx_lvs_2_Tbl_Pts_to_a_DTT_KEY_id_DTT
    end
    
    create_table(:Link_Tax_jurisdiction_Tax_levies_Type_of_tax, :ignore_index_errors=>true) do
      foreign_key :id_tax_juridiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      foreign_key :id_tax_levies, :Table_tax_levies, :null=>false, :key=>[:id_tax_levies]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      String :name_of_tax, :size=>100
      
      primary_key [:id_tax_juridiction, :id_tax_levies, :id_type_of_tax]
      
      index [:id_type_of_tax], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tp_of_tx_KEY_id_tp_of_tax
      index [:id_tax_juridiction], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_jdn_KEY_id_tax_jdn
      index [:id_tax_levies], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_lvs_KEY_id_tax_levies
    end
    
    create_table(:Link_tax_jurisdiction_allowance_type, :ignore_index_errors=>true) do
      foreign_key :id_allowance, :Table_allowance_rates, :null=>false, :key=>[:id_allowance]
      foreign_key :id_type_of_allowance, :Table_type_of_allowance, :null=>false, :key=>[:id_type_of_allowance]
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      foreign_key :id_allowance_requirements, :Table_allowance_requirements, :null=>false, :key=>[:id_allowance_requirements]
      String :name_of_allowance, :size=>100, :null=>false
      
      primary_key [:id_allowance, :id_type_of_allowance, :id_tax_jurisdiction, :id_allowance_requirements]
      
      index [:id_type_of_allowance], :name=>:fk_1_LK_tax_jdn_awc_tp_2_Tbl_tp_of_awc_KEY_id_type_of_allowance
      index [:id_allowance], :name=>:fk_1_LK_tax_jdn_awc_type_2_Tbl_awc_rates_KEY_id_allowance
      index [:id_tax_jurisdiction], :name=>:fk_1_LK_tax_jdn_awc_type_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
      index [:id_allowance_requirements], :name=>:fk_1_LK_tx_jdn_awc_tp_2_Tbl_awc_rqt_KEY_id_allowance_rqt
    end
    
    create_table(:Link_type_of_tax_and_economic_activity, :ignore_index_errors=>true) do
      foreign_key :id_type_of_economic_activity, :Table_type_of_economic_activity, :null=>false, :key=>[:id_type_of_economic_activity]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      Integer :id_Link_type_of_tax_and_economic_activity, :null=>false
      foreign_key :id_type_of_economic_sector, :Table_type_of_economic_sector, :null=>false, :key=>[:id_type_of_economic_sector]
      foreign_key :id_type_of_economic_profession, :Table_type_of_economic_profession, :null=>false, :key=>[:id_type_of_economic_profession]
      
      primary_key [:id_type_of_economic_activity, :id_type_of_tax, :id_Link_type_of_tax_and_economic_activity, :id_type_of_economic_sector, :id_type_of_economic_profession]
      
      index [:id_type_of_economic_activity], :name=>:fk_1_LK_tp_f_tx_and_enc_avy_2_Tbl_tp_f_enc_avy_KEY_tp_of_enc_avy
      index [:id_type_of_economic_profession], :name=>:fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_tp_f_enc_prf_KEY_tp_f_enc_s_idx
      index [:id_type_of_economic_sector], :name=>:fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_tp_f_enc_sec_KEY_tp_f_enc_s_idx
      index [:id_type_of_tax], :name=>:fk_1_LK_tp_of_tax_and_enc_avy_2_Tbl_tp_of_tax_KEY_id_type_o_idx
      index [:id_Link_type_of_tax_and_economic_activity], :name=>:id_Link_type_of_tax_and_economic_activity_UNIQUE, :unique=>true
    end
    
    create_table(:Table_citizenship, :ignore_index_errors=>true) do
      Integer :id_citizenship, :null=>false
      String :name_citizenship, :size=>45, :null=>false
      foreign_key :abbreviation_country, :Table_tax_jurisdiction_country, :type=>String, :size=>45, :null=>false, :key=>[:abbreviation_country]
      
      primary_key [:id_citizenship, :abbreviation_country]
      
      index [:id_citizenship], :name=>:fk_1_Tbl_psl_chts_2_Tbl_ctzp_KEY_id_ctzp
    end
    
    create_table(:Table_financial_year, :ignore_index_errors=>true) do
      foreign_key :id_tax_levies, :Table_tax_levies, :null=>false, :key=>[:id_tax_levies]
      Date :financial_year_start, :null=>false
      Date :financial_year_stop, :null=>false
      
      primary_key [:id_tax_levies, :financial_year_start, :financial_year_stop]
      
      index [:id_tax_levies], :name=>:fk_1_Table_financial_year_2_Table_tax_levies_KEY_id_tax_levies
    end
    
    create_table(:Table_payment_date) do
      primary_key :id_tax_levies, :table=>:Table_tax_levies, :key=>[:id_tax_levies]
      Date :payment_date, :null=>false
    end
    
    create_table(:Table_tax_jurisdiction_state, :ignore_index_errors=>true) do
      foreign_key :abbreviation_country, :Table_tax_jurisdiction_country, :type=>String, :size=>45, :null=>false, :key=>[:abbreviation_country]
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      Integer :id_state, :null=>false
      String :abbreviation_state, :size=>45, :null=>false
      String :name_state, :size=>45, :null=>false
      
      primary_key [:abbreviation_country, :id_tax_jurisdiction, :abbreviation_state]
      
      index [:abbreviation_country], :name=>:fk_1_Tbl_tax_jdn_state_2_Tbl_tax_jdn_KEY_abr_country
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_tax_jdn_state_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
      index [:abbreviation_state], :name=>:index_name_state
    end
    
    create_table(:Table_tax_order) do
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      String :tax_order, :size=>45, :null=>false
      
      primary_key [:id_type_of_tax, :tax_order]
    end
    
    create_table(:Table_personal_characteristics, :ignore_index_errors=>true) do
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      Integer :id_personal_characteristics, :null=>false
      foreign_key :id_citizenship, :Table_citizenship, :null=>false, :key=>[:id_citizenship]
      foreign_key :id_maritas_status, :Table_marital_status, :null=>false, :key=>[:id_maritas_status]
      foreign_key :id_age, :Table_age_category, :null=>false, :key=>[:id_age]
      
      primary_key [:id_type_of_tax, :id_personal_characteristics, :id_citizenship, :id_maritas_status, :id_age]
      
      index [:id_age], :name=>:fk_1_Tbl_psl_chts_2_Tbl_age_ctg_KEY_id_age_idx
      index [:id_citizenship], :name=>:fk_1_Tbl_psl_chts_2_Tbl_ctzp_KEY_id_ctzp_idx
      index [:id_maritas_status], :name=>:fk_1_Tbl_psl_chts_2_Tbl_mrt_sts_KEY_id_mrt_sts_idx
      index [:id_personal_characteristics], :name=>:id_pls_chts_INDEX
    end
    
    create_table(:Table_tax_jurisdiction_region, :ignore_index_errors=>true) do
      foreign_key :abbreviation_state, :Table_tax_jurisdiction_state, :type=>String, :size=>45, :null=>false, :key=>[:abbreviation_state]
      foreign_key :id_tax_juridiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      Integer :id_region, :null=>false
      String :abbreviation_region, :size=>45, :null=>false
      String :name_region, :size=>45, :null=>false
      
      primary_key [:abbreviation_state, :id_tax_juridiction, :abbreviation_region]
      
      index [:abbreviation_state], :name=>:fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_KEY_abr_state
      index [:id_tax_juridiction], :name=>:fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_KEY_id_tax_jdn_idx
      index [:abbreviation_region], :name=>:id_index_name_region
      index [:id_tax_juridiction], :name=>:id_tax_juridiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_tax_jurisdiction_area, :ignore_index_errors=>true) do
      foreign_key :abbreviation_region, :Table_tax_jurisdiction_region, :type=>String, :size=>45, :null=>false, :key=>[:abbreviation_region]
      foreign_key :id_tax_juridiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      String :id_area, :size=>45, :null=>false
      String :abbreviation_area, :size=>45, :null=>false
      String :name_area, :size=>45, :null=>false
      
      primary_key [:abbreviation_region, :id_tax_juridiction, :abbreviation_area]
      
      index [:id_tax_juridiction], :name=>:fk_1_Tbl_tax_jdn_area_2_Tbl_tax_jdn_KEY_id_tax_jdn
      index [:abbreviation_region], :name=>:fk_1_Tbl_tax_jdn_area_2_Tbl_tax_jdn_region_KEY_abr_region
      index [:id_tax_juridiction], :name=>:id_tax_juridiction_UNIQUE, :unique=>true
    end
  end
end
