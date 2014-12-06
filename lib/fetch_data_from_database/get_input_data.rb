# Basic code to get Sequel to work => begin
require "yaml"
require "sequel"

file_path = File.expand_path "../../../config/sequel_database.yaml",__FILE__
file = YAML.load_file(file_path);
DB = Sequel.connect(file)
# => End of the code
puts "Sequel connection file"
puts file

# Preloading the data for the Class Creation 
require_relative "../class_creations/create_get_send_input_data_sequel"

module GetInputData
 
  def self.get_data_from_sequel(params)
    @data_from_selection = CreateGetSendInputDataSequel.new(params);
        
    return convert_the_data_to_html();
  end
 
  def self.convert_the_data_to_html()
    puts "Convert the data to HTML"
    puts @data_from_selection;
    
    hash_to_store_html_elements = {};
    
    for number in 0..@data_from_selection.array_length
      puts number;
      hash_to_store_html_elements[@data_from_selection.html_element_name[number].to_sym] = convert_db_results_to_html(@data_from_selection.got_from_DB[number],@data_from_selection.table_column_abbreviation[number],@data_from_selection.table_column_name[number]);
    end
    
    puts hash_to_store_html_elements;
    return hash_to_store_html_elements;
  end
  
  def self.convert_db_results_to_html(got_from_DB,table_column_name,table_column_abbreviation)
    puts "This is convert_db_results_to_html"
    array_to_store_html_elements = ["<option value='' ></option>"];# I used to have this: "<option value='Not_Set'>Not Set</option>"]
    
    for number in 0..(got_from_DB.length-1) #Because the array count starts at one
      array_to_store_html_elements << "<option value=#{got_from_DB[number][table_column_name]}>#{got_from_DB[number][table_column_abbreviation]}</option>"
    end
    puts array_to_store_html_elements
    return array_to_store_html_elements;
  end
end
