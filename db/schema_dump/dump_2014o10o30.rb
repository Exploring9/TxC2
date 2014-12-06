Sequel.migration do
  change do
    create_table(:LookUp_allowance) do
      String :id_allowance, :size=>1, :null=>false
      String :comments, :size=>500, :null=>false
      
      primary_key [:id_allowance]
    end
    
    create_table(:LookUp_scope_of_tax_non_residents) do
      primary_key :id_scope_of_tax_non_resident
      String :scope_of_tax, :size=>45, :null=>false
      String :comments, :size=>500, :null=>false
    end
    
    create_table(:LookUp_scope_of_tax_resident) do
      primary_key :id_scope_of_tax_resident
      String :scope_of_tax, :size=>45, :null=>false
      String :comments, :size=>500, :null=>false
    end
    
    create_table(:LookUp_tax_order) do
      primary_key :tax_order
      String :comments, :size=>500, :null=>false
    end
    
    create_table(:LookUp_time_requirement_of_tax) do
      String :time_requirement, :size=>45, :null=>false
      Integer :holding_period, :null=>false
      String :measurement_of_holding_period, :size=>45, :null=>false
      
      primary_key [:time_requirement, :holding_period]
    end
    
    create_table(:Table_DTT_type_of_relief) do
      String :DTT_type_of_relief, :size=>45, :null=>false
      
      primary_key [:DTT_type_of_relief]
    end
    
    create_table(:Table_age_category) do
      primary_key :id_age
      Integer :age_start
      Integer :age_stop
      Date :birth_date
    end
    
    create_table(:Table_controlling_interest, :ignore_index_errors=>true) do
      Integer :id_controlling_interest, :null=>false
      Integer :id_grouping_interest, :null=>false
      String :comments, :size=>500, :null=>false
      
      primary_key [:id_controlling_interest, :id_grouping_interest]
      
      index [:id_grouping_interest], :name=>:index2
    end
    
    create_table(:Table_currency) do
      Integer :id_currency, :null=>false
      String :name_currency, :size=>45, :null=>false
      
      primary_key [:id_currency, :name_currency]
    end
    
    create_table(:Table_financial_year, :ignore_index_errors=>true) do
      Date :financial_year_start, :null=>false
      Date :financial_year_stop, :null=>false
      Integer :id_financial_year, :null=>false
      
      primary_key [:financial_year_start, :financial_year_stop, :id_financial_year]
      
      index [:id_financial_year], :name=>:index2
    end
    
    create_table(:Table_marital_status) do
      Integer :id_marital_status, :null=>false
      String :name_marital_status, :size=>45, :null=>false
      
      primary_key [:id_marital_status, :name_marital_status]
    end
    
    create_table(:Table_tax_jurisdiction, :ignore_index_errors=>true) do
      primary_key :id_tax_jurisdiction
      String :jurisdiction_used, :default=>"Y", :size=>1, :null=>false
      
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_tax_jdn_2_Tbl_tax_jdn_countries_KEY_id_tax_jurisdiction
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
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
    
    create_table(:Table_type_of_economic_source, :ignore_index_errors=>true) do
      Integer :id_type_of_economic_source, :null=>false
      String :name_type_of_economic_source, :size=>45, :null=>false
      
      primary_key [:id_type_of_economic_source, :name_type_of_economic_source]
      
      index [:id_type_of_economic_source], :name=>:id_type_of_economic_activity_UNIQUE, :unique=>true
    end
    
    create_table(:Table_way_of_tax_levy) do
      String :way_of_tax_levy, :size=>45, :null=>false
      
      primary_key [:way_of_tax_levy]
    end
    
    create_table(:Link_type_of_tax_and_economic_activity, :ignore_index_errors=>true) do
      foreign_key :id_type_of_economic_source, :Table_type_of_economic_source, :null=>false, :key=>[:id_type_of_economic_source]
      Integer :id_Link_type_of_tax_and_economic_activity, :null=>false
      foreign_key :id_type_of_economic_sector, :Table_type_of_economic_sector, :null=>false, :key=>[:id_type_of_economic_sector]
      foreign_key :id_type_of_economic_profession, :Table_type_of_economic_profession, :null=>false, :key=>[:id_type_of_economic_profession]
      foreign_key :id_controlling_interest, :Table_controlling_interest, :null=>false, :key=>[:id_controlling_interest]
      
      primary_key [:id_type_of_economic_source, :id_Link_type_of_tax_and_economic_activity, :id_type_of_economic_sector, :id_type_of_economic_profession, :id_controlling_interest]
      
      index [:id_type_of_economic_source], :name=>:fk_1_LK_tp_f_tx_and_enc_avy_2_Tbl_tp_f_enc_avy_KEY_tp_of_enc_avy
      index [:id_controlling_interest], :name=>:fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_ctg_int_KEY_id_ctg_int_idx
      index [:id_type_of_economic_profession], :name=>:fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_tp_f_enc_prf_KEY_tp_f_enc_s_idx
      index [:id_type_of_economic_sector], :name=>:fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_tp_f_enc_sec_KEY_tp_f_enc_s_idx
      index [:id_Link_type_of_tax_and_economic_activity], :name=>:id_Link_type_of_tax_and_economic_activity_UNIQUE, :unique=>true
      index [:id_type_of_economic_source, :id_Link_type_of_tax_and_economic_activity, :id_type_of_economic_sector, :id_type_of_economic_profession], :name=>:index7, :unique=>true
    end
    
    create_table(:Table_grouping_controlling_interest) do
      Integer :percentage_controlling_interest, :null=>false
      foreign_key :id_grouping_interest, :Table_controlling_interest, :null=>false, :key=>[:id_grouping_interest]
      
      primary_key [:percentage_controlling_interest, :id_grouping_interest]
    end
    
    create_table(:Table_jurisdiction_currency, :ignore_index_errors=>true) do
      foreign_key :id_currency, :Table_currency, :null=>false, :key=>[:id_currency]
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      
      primary_key [:id_currency, :id_tax_jurisdiction]
      
      index [:id_tax_jurisdiction], :name=>:fk_1_Tbl_jdn_crc_2_Tbl_tax_jdn_KEY_id_tax_jdn_idx
    end
    
    create_table(:Table_parties_to_a_DTT, :ignore_index_errors=>true) do
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      Integer :id_country_earned_DTT, :null=>false
      String :Grouping_for_a_DTT, :size=>500, :null=>false
      Date :Effective_DTT_date, :null=>false
      String :Special_name_DTT, :size=>45, :null=>false
      String :Super_National, :size=>500, :null=>false
      String :Legal_Agreeement, :size=>1, :null=>false
      Integer :id_unique_DTT, :null=>false
      foreign_key :id_tax_jurisdiction_resident, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      
      primary_key [:id_tax_jurisdiction, :id_country_earned_DTT, :id_unique_DTT, :id_tax_jurisdiction_resident]
      
      index [:id_tax_jurisdiction_resident], :name=>:fk_1_Tbl_pts_to_a_DTT_2_Tbl_tx_jdn_KEY_id_tx_jdn_rsd_idx
      index [:id_country_earned_DTT], :name=>:index2
    end
    
    create_table(:Table_tax_jurisdiction_country, :ignore_index_errors=>true) do
      String :abbreviation_country, :size=>45, :null=>false
      foreign_key :id_tax_jurisdiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      String :name_country, :size=>45, :null=>false
      Integer :id_country, :null=>false
      
      primary_key [:abbreviation_country, :id_tax_jurisdiction]
      
      index [:abbreviation_country], :name=>:Secondary
      index [:id_tax_jurisdiction], :name=>:id_tax_jurisdiction_UNIQUE, :unique=>true
    end
    
    create_table(:Table_tax_levies, :ignore_index_errors=>true) do
      Integer :id_tax_levies, :null=>false
      Integer :tax_levy_level, :null=>false
      foreign_key :way_of_tax_levy, :Table_way_of_tax_levy, :type=>String, :size=>45, :null=>false, :key=>[:way_of_tax_levy]
      Integer :start_of_tax_levy, :null=>false
      Integer :end_of_tax_levy, :null=>false
      foreign_key :id_financial_year, :Table_financial_year, :null=>false, :key=>[:id_financial_year]
      foreign_key :id_currency, :Table_currency, :null=>false, :key=>[:id_currency]
      
      primary_key [:id_tax_levies, :id_financial_year, :id_currency]
      
      index [:id_financial_year], :name=>:fk_1_Tbl_fcl_year_2_Tbl_tax_levies_KEY_id_fcl_year_idx
      index [:id_currency], :name=>:fk_1_Tbl_tax_levies_2_Tbl_currency_KEY_id_tax_levies_idx
      index [:way_of_tax_levy], :name=>:fk_1_Tbl_tax_levies_2_Tbl_way_f_tax_levy_KEY_way_f_tax_levy_idx
      index [:id_tax_levies, :id_financial_year], :name=>:id_tax_levies_UNIQUE, :unique=>true
    end
    
    create_table(:Table_citizenship, :ignore_index_errors=>true) do
      Integer :id_citizenship, :null=>false
      String :name_citizenship, :size=>45, :null=>false
      foreign_key :abbreviation_country, :Table_tax_jurisdiction_country, :type=>String, :size=>45, :null=>false, :key=>[:abbreviation_country]
      
      primary_key [:id_citizenship, :abbreviation_country]
      
      index [:id_citizenship], :name=>:fk_1_Tbl_psl_chts_2_Tbl_ctzp_KEY_id_ctzp
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
    
    create_table(:Table_personal_characteristics, :ignore_index_errors=>true) do
      Integer :id_personal_characteristics, :null=>false
      foreign_key :id_citizenship, :Table_citizenship, :null=>false, :key=>[:id_citizenship]
      foreign_key :id_marital_status, :Table_marital_status, :null=>false, :key=>[:id_marital_status]
      foreign_key :id_age, :Table_age_category, :null=>false, :key=>[:id_age]
      String :comments, :size=>100
      
      primary_key [:id_personal_characteristics, :id_citizenship, :id_marital_status, :id_age]
      
      index [:id_age], :name=>:fk_1_Tbl_psl_chts_2_Tbl_age_ctg_KEY_id_age_idx
      index [:id_citizenship], :name=>:fk_1_Tbl_psl_chts_2_Tbl_ctzp_KEY_id_ctzp_idx
      index [:id_marital_status], :name=>:fk_1_Tbl_psl_chts_2_Tbl_mrt_sts_KEY_id_mrt_sts_idx
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
    
    create_table(:Table_type_of_tax, :ignore_index_errors=>true) do
      Integer :id_type_of_tax, :null=>false
      foreign_key :id_personal_characteristics, :Table_personal_characteristics, :null=>false, :key=>[:id_personal_characteristics]
      foreign_key :id_Link_type_of_tax_and_economic_activity, :Link_type_of_tax_and_economic_activity, :null=>false, :key=>[:id_Link_type_of_tax_and_economic_activity]
      foreign_key :id_allowance, :LookUp_allowance, :type=>String, :size=>1, :null=>false, :key=>[:id_allowance]
      String :types_of_taxes, :size=>500, :null=>false
      foreign_key :id_scope_of_tax_resident, :LookUp_scope_of_tax_resident, :null=>false, :key=>[:id_scope_of_tax_resident]
      foreign_key :time_requirement, :LookUp_time_requirement_of_tax, :type=>String, :size=>45, :null=>false, :key=>[:time_requirement]
      foreign_key :tax_order, :LookUp_tax_order, :null=>false, :key=>[:tax_order]
      foreign_key :id_scope_of_tax_non_resident, :LookUp_scope_of_tax_non_residents, :null=>false, :key=>[:id_scope_of_tax_non_resident]
      
      primary_key [:id_type_of_tax, :id_personal_characteristics, :id_Link_type_of_tax_and_economic_activity]
      
      index [:id_type_of_tax, :id_allowance, :id_Link_type_of_tax_and_economic_activity, :id_personal_characteristics], :name=>:Uniqueness_constraint_4_allowance_type_of_tax, :unique=>true
      index [:id_allowance], :name=>:fk_1_Tbl_t_f_tx_2_LUp_allowance_KEY_id_allowance_idx
      index [:id_scope_of_tax_non_resident], :name=>:fk_1_Tbl_t_f_tx_2_LUp_scp_f_t_non_rdc_KEY_id_scp_f_t_non_rd_idx
      index [:id_Link_type_of_tax_and_economic_activity], :name=>:fk_1_Tbl_t_f_tx_2_Link_t_f_tx_n_enc_avy_KEY_id_L_t_f_t_d_en_idx
      index [:id_scope_of_tax_resident], :name=>:fk_1_Tbl_type_of_tax_2_LUp_scope_of_tax_rdt_KEY_scope_of_ta_idx
      index [:tax_order], :name=>:fk_1_Tbl_type_of_tax_2_LUp_tax_order_KEY_tax_order
      index [:time_requirement], :name=>:fk_1_Tbl_type_of_tax_2_LUp_time_rqt_of_tax_KEY_time_requirements
      index [:id_personal_characteristics], :name=>:fk_1_Tbl_type_of_tx_2_Tbl_psl_chts_KEY_id_psl_chts_idx
    end
    
    create_table(:Link_DTT_tax_type_tax_levies, :ignore_index_errors=>true) do
      foreign_key :id_tax_levies, :Table_tax_levies, :null=>false, :key=>[:id_tax_levies]
      foreign_key :DTT_type_of_relief, :Table_DTT_type_of_relief, :type=>String, :size=>45, :null=>false, :key=>[:DTT_type_of_relief]
      foreign_key :id_country_earned_DTT, :Table_parties_to_a_DTT, :null=>false, :key=>[:id_country_earned_DTT]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      
      primary_key [:id_tax_levies, :DTT_type_of_relief, :id_country_earned_DTT, :id_type_of_tax]
      
      index [:DTT_type_of_relief], :name=>:fk_1_Link_DTT_tx_tp_tx_lvs_2_Tbl_DTT_tp_f_rlf_KEY_DTT_tp_f__idx
      index [:id_country_earned_DTT], :name=>:fk_1_Link_DTT_tx_tp_tx_lvs_2_Tbl_pts_to_a_DTT_KEY_id_cty_en_idx
      index [:id_type_of_tax], :name=>:fk_1_Link_DTT_tx_tp_tx_lvs_2_Tbl_tp_f_tx_KEY_id_tp_f_tx_idx
    end
    
    create_table(:Link_Tax_jurisdiction_Tax_levies_Type_of_tax, :ignore_index_errors=>true) do
      foreign_key :id_tax_levies, :Table_tax_levies, :null=>false, :key=>[:id_tax_levies]
      foreign_key :id_tax_juridiction, :Table_tax_jurisdiction, :null=>false, :key=>[:id_tax_jurisdiction]
      foreign_key :id_type_of_tax, :Table_type_of_tax, :null=>false, :key=>[:id_type_of_tax]
      String :name_of_tax, :size=>100
      
      primary_key [:id_tax_levies, :id_tax_juridiction, :id_type_of_tax]
      
      index [:id_type_of_tax], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tp_of_tx_KEY_id_tp_of_tax
      index [:id_tax_juridiction], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_jdn_KEY_id_tax_jdn
      index [:id_tax_levies], :name=>:fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_lvs_KEY_id_tax_levies
    end
  end
end
