module DatabaseTableHtmlEquivalents
  #This is used to fetch the data from sequel in the array [0 - Table name in sequel/ 1 - Value name in Sequel DB / 2 - Full name in Sequel DB]
  # It is matched to the DOM's element name 
  # Used by: create_get_send_input_data_sequel.rb
  @html_to_database_tables_equivalents = {
      "data_Person_Residence_Country" => {:table => "Table_tax_jurisdiction_country", :abbreviation => "abbreviation_country", :name => "name_country"},
      "data_Person_Residence_State" => {:table => "Table_tax_jurisdiction_state", :abbreviation => "abbreviation_state", :name => "name_state"},
      "data_Person_Residence_Region" => {:table => "Table_tax_jurisdiction_region", :abbreviation => "abbreviation_region", :name => "name_region"},
      "data_Person_Residence_Area" => {:table => "Table_tax_jurisdiction_area", :abbreviation => "abbreviation_area", :name => "name_area"},
      "data_Person_Citizenship" => {:table => "Table_citizenship", :abbreviation => "abbreviation_country", :name => "name_citizenship"},
      "data_Person_Marital_Status" => {:table => "Table_marital_status", :abbreviation => "name_marital_status", :name => "name_marital_status"},
      "data_Income_Currency" => {:table => "Table_currency", :abbreviation => "name_currency", :name => "name_currency"},
      "data_Income_Source" => {:table => "Table_type_of_economic_source", :abbreviation => "name_type_of_economic_source", :name => "name_type_of_economic_source"},
      "data_Income_Location_Country" => {:table => "Table_tax_jurisdiction_country", :abbreviation => "abbreviation_country", :name => "name_country"},
      "data_Income_Location_State" => {:table => "Table_tax_jurisdiction_state", :abbreviation => "abbreviation_state", :name => "name_state"},
      "data_Income_Location_Region" => {:table => "Table_tax_jurisdiction_region", :abbreviation => "abbreviation_region", :name => "name_region"},
      "data_Income_Location_Area" => {:table => "Table_tax_jurisdiction_area", :abbreviation => "abbreviation_area", :name => "name_area"},
      "data_Income_Economic_Sector" => {:table => "Table_type_of_economic_sector", :abbreviation => "name_type_of_economic_sector", :name => "name_type_of_economic_sector"},
      "data_Income_Specific_Profession" => {:table => "Table_type_of_economic_profession", :abbreviation => "name_type_of_economic_profession", :name => "name_type_of_economic_profession"},
  };  
  # This matches the names in the ActiveRecords database to the DOM's element name
  # Used by: active_record_insertions.rb
  @database_active_records_tables = {
     "residence_country" => "data_Person_Residence_Country",
     "residence_state" => "data_Person_Residence_State",
     "residence_region" => "data_Person_Residence_Region",
     "residence_area" => "data_Person_Residence_Area",
     "citizenship" => "data_Person_Citizenship",
     "marital_status" => "data_Person_Marital_Status",
     "birthday" => "data_Person_Birthday",
     "number_of_children" => "data_Person_Number_of_Children",
     
     "income_size" => "data_Income_Size",
     "income_currency" => "data_Income_Currency",
     "income_source" => "data_Income_Source",
     "income_location_country" => "data_Income_Location_Country",
     "income_location_state" => "data_Income_Location_State",
     "income_location_region" => "data_Income_Location_Region",
     "income_location_area" => "data_Income_Location_Area",
     "income_date_earned" => "data_Income_Date_Earned",
     "income_controlling_interest" => "data_Income_Controlling_Interest",
     "income_assets_holding_period_days" => "data_Income_Assets_Holding_Period_Days",
     "income_economic_sector" => "data_Income_Economic_Sector",
     "income_specific_profession" => "data_Income_Specific_Profession",
  };
  
  def self.html_to_database_tables_equivalents()
    return @html_to_database_tables_equivalents;
  end

  def self.database_active_records_tables()
    return @database_active_records_tables;
  end
  
end