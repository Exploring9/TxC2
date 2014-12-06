
module ActiveRecordInsertions
  # Do I need it?
  #attr_reader :legal_entity, :sizes_of_income, :types_of_income, :locations_of_income
  def self.active_records_way_create(params)
    puts "This is the residence in the rails_way_create"
    @params_for_calculator  = JSON.parse(params);
    puts "This is @params_for_calculator: (I was gotten by JSON.parsing the params)"
    puts @params_for_calculator;
    
    @params_for_Personal_Info = @params_for_calculator["personal_Data_Object_Created"]
    puts "This is the personal params: (@params_for_Personal_Info) "
    puts @params_for_Personal_Info
    #Create the Person's Record in the DB
    #Select the first element in the array -> it is the first inserted
    
    @database_active_records_tables = DatabaseTableHtmlEquivalents::database_active_records_tables
    
    legal_entity_details = TableSearcherPersonalInformation.create(
    residence_country: @params_for_Personal_Info[@database_active_records_tables["residence_country"]],
    residence_state: @params_for_Personal_Info[@database_active_records_tables["residence_state"]],
    residence_region: @params_for_Personal_Info[@database_active_records_tables["residence_region"]], 
    residence_area: @params_for_Personal_Info[@database_active_records_tables["residence_area"]], 
    citizenship: @params_for_Personal_Info[@database_active_records_tables["citizenship"]], 
    marital_status: @params_for_Personal_Info[@database_active_records_tables["marital_status"]], 
    birthday: @params_for_Personal_Info[@database_active_records_tables["birthday"]], 
    number_of_children: @params_for_Personal_Info[@database_active_records_tables["number_of_children"]]);  
    
    @params_for_Economic_Info = @params_for_calculator.except("personal_Data_Object_Created");
    

    #Loop over each and add all of the details
    @params_for_Economic_Info.each {|key, value| 
    TableSearchedInformationByUser.create(
    table_searcher_personal_information_id: legal_entity_details.id,
      income_size: value[@database_active_records_tables["income_size"]],
      income_currency: value[@database_active_records_tables["income_currency"]],
      income_source: value[@database_active_records_tables["income_source"]],
      income_location_country: value[@database_active_records_tables["income_location_country"]],
      income_location_state: value[@database_active_records_tables["income_location_state"]],
      income_location_region: value[@database_active_records_tables["income_location_region"]],
      income_location_area: value[@database_active_records_tables["income_location_area"]],
      income_date_earned: value[@database_active_records_tables["income_date_earned"]],
      income_assets_holding_period_days: value[@database_active_records_tables["income_assets_holding_period_days"]],
      income_controlling_interest: value[@database_active_records_tables["income_controlling_interest"]], #New insertion
      income_economic_sector: value[@database_active_records_tables["income_economic_sector"]],
      income_specific_profession: value[@database_active_records_tables["income_specific_profession"]])
    };
    puts "Legal Entity Details:";
    puts legal_entity_details.id;
    return legal_entity_details.id;
  end
  
  def more_information_details()
    puts params 
    puts params.class
    puts JSON.parse(params);
    
    puts @params_for_Personal_Info["data_Person_Residence_Country"];
    puts @params_for_Personal_Info["data_Person_Residence_State"];
    puts @params_for_Personal_Info["data_Person_Residence_Region"];
    puts @params_for_Personal_Info["data_Person_Residence_Area"];
    puts @params_for_Personal_Info["data_Person_Citizenship"];
    puts @params_for_Personal_Info["data_Person_Marital_Status"];
    puts @params_for_Personal_Info["data_Person_Birthday"];
    puts @params_for_Personal_Info["data_Person_Number_Of_Children"];
    
    puts @params_for_Economic_Info; 
  end
  
end