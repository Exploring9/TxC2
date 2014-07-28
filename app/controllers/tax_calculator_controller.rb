require_relative '../../lib/parsers/params_parser'

class TaxCalculatorController < ApplicationController
  include ParamsParser
  
  def index
  end
  
  def personalAndTaxInfo
    puts "This is the personalInfo method - the params received:"+params.inspect
    puts "This is the request body:"+ request.body.read
    puts ParamsParser
    parse_incoming_information(params);
    
    #This allows this function to be called with ajax and render nothing on the web page
    render :nothing => true, :status => 200, :content_type => 'html' 

    puts TableSearchedInformationByUsers.all
    @testing_hash = {"residence"=>"LV"}
    puts "This is @testing_hash"
    puts @testing_hash
    puts residence

    rails_way_create(residence);
    #mysql_way_create(residence)
  end
  
  def mysql_way_create(residence)
    sql_sentence = "INSERT INTO `DB_TxC_TESTING3`.`table_searched_information_by_users` 
    (`id_searched_info`, `residence`, `size_of_income`, `source_of_income`)#
     VALUES ('4', 'LV', '5000', '7');"

    ActiveRecord::Base.connection.execute(sql_sentence);
    show_tables_info = []
    show_tables_info = ActiveRecord::Base.connection.execute("SHOW TABLES;").each do |record|
      puts record
    end;
    #puts show_tables_info.methods
    puts show_tables_info.inspect
    
    show_residence_info = ActiveRecord::Base.connection.execute("SELECT * FROM
     table_searched_information_by_users").each do |record|
       puts record
  end
  end
  
  
  def rails_way_create(residence)
    puts "This is residence in the rails_way_create"
    puts residence
    #I need to require this instance variable from my module
    
    @residence_info = TableSearchedInformationByUsers.new(@residence);

    #@residence_info = TableSearchedInformationByUsers.new(params.permit(:residence, :sizesOfIncomeArray, :typesOfIncomeArray, :locationsOfIncomeArray));
    
    if @residence_info.save
      puts "The residence info object saved"
    end
    
    puts TableSearchedInformationByUsers.all
  end
  
end
