require_relative '../../lib/database_equivalents/database_table_html_equivalents' #This is to get the relative database and html tables mapping for sequel
class CreateGetSendInputDataSequel
  include DatabaseTableHtmlEquivalents
  attr_reader :html_params, :table_name, :table_column_abbreviation, :table_column_name, :upper_location_name, :array_length,:html_element_name, :got_from_DB, :upper_table_column_abbreviation

  def initialize(params)
    #Mapping the DOM's select element name to database table 1: Database Table // 2: Abbreviation within the Database // 3: Get back to the user as a choice
    @html_to_database_tables_equivalents = DatabaseTableHtmlEquivalents.html_to_database_tables_equivalents();
    @html_params = params;
    puts "This is initialize for CreateGetSendInputDataSequel"
    # Make all of these elements push into an array; puts @html_params
    @array_length = @html_params["name"].length - 1; #Since it starts counting from zero
    @html_element_name = [];
    @table_name = [];
    @table_column_abbreviation = [];
    @upper_table_column_abbreviation = [];
    @table_column_name = [];
    @got_from_DB = []; # This is the value that I get from the DB and will use to create the HTML tags

    #puts "Space for @array_length"; puts @array_length;
    #puts @html_params["data-selector"]; puts @html_params["data-selector"].class
    puts @html_to_database_tables_equivalents["data_Person_Residence_Country"]
    puts @html_to_database_tables_equivalents["data_Person_Residence_Country"][:name]
    #This is the split between the preload element (1st) and the second which loads up when a country is chosen
    if(@html_params["data-selector"] === nil) # data-selector is not present as a separate information by the stuff Ajax sent
     puts "This is where @html_params[\"selected\"] === nil"
     for i in 0..@array_length
        html_params_name = @html_params["name"][i];
        html_db_equivalents = @html_to_database_tables_equivalents[html_params_name]
        @html_element_name << html_params_name.to_sym;
        @table_name << html_db_equivalents[:table].to_sym;
        @table_column_abbreviation << html_db_equivalents[:abbreviation].to_sym;
        @table_column_name << html_db_equivalents[:name].to_sym;
        @got_from_DB[i] = DB[@table_name[i]].all;
      end
      start_testing_sequel()
      
      #TODO Set a normal elsif parameter + Select only for the appropriate country!!! -> tax jurisdictions for the regions!
    elsif(@html_params["data-selector"][0].class == String)
      puts "This is where [\"data-selector\"][0].class == String"
      for i in 0..@array_length
        html_params_data_selector = @html_params["data-selector"][i]
        html_db_equivalents = @html_to_database_tables_equivalents[html_params_data_selector]
        @html_element_name << html_params_data_selector.to_sym;
        @table_name << html_db_equivalents[:table].to_sym;
        @table_column_abbreviation << html_db_equivalents[:abbreviation].to_sym;
        @upper_table_column_abbreviation << @html_to_database_tables_equivalents[@html_params["name"][i]][:abbreviation].to_sym;
        @table_column_name << html_db_equivalents[:name].to_sym;
        @got_from_DB[i] = DB[@table_name[i]].where(@upper_table_column_abbreviation[i] => @html_params["selected"]).all;
      end
      start_testing_sequel();
    else
      puts "Error in Initialization of CreateGetSendInputDataSequel ¬¬"
    end    
  end
  
  def start_testing_sequel()
    puts "This is: start_testing_sequel"
    puts @table_column_abbreviation.inspect
    puts @table_column_name
    puts @table_name
    puts @html_params
    puts @got_from_DB
    puts @got_from_DB.inspect
    
    #puts DB[:Table_tax_jurisdiction].all
    #DB.extension :schema_dumper
    #puts DB.dump_schema_migration();
    #testing_sequel #This is to call the function in another file

    #table_tax_jurisdiction = DB[:Table_tax_jurisdiction]
    #puts DB[:Table_tax_jurisdiction_country].all
    #puts DB[:Table_tax_jurisdiction_state].all
    #puts DB[:Table_tax_jurisdiction_region].all
    #puts DB[:Table_tax_jurisdiction_area].all
    #puts table_tax_jurisdiction.first
  end
    
end