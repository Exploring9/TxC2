require_relative '../../lib/database_insertions/active_record_insertions' #This is to include a file
require_relative '../../lib/tax_calculations_start/tax_calculations_start' #This is to include the file where the tax calculation process will start
require_relative '../../sequel_database/testing_sequel'
require_relative '../../lib/fetch_data_from_database/get_input_data'#This where I will get the data from the database

class TaxCalculatorController < ApplicationController
  include ActiveRecordInsertions #Needed to put the information in the database
  include TaxCalculationsStart
  include TestingSequel #This is only for testing the sequel database
  include GetInputData # Module to get data from the database for the select input
  
  def index
    puts "Hello this is Index"
  end
  
  #This calls 3 functions:
  # 1st - The function that will include all the data into the database
  # 2nd - The function that will call the calculation of the taxes (Use the return from active_records_way_create to find the id)
  # 3rd - The function will return the data that can be represented nicely in the front-end
  
  def personalAndTaxInfo
    puts "This is the personalInfo method - the params received:"+params.inspect
    puts "This is the request body:"+ request.body.read
    
    #This is to call the function to include values in the database
    @id_info_searcher = active_records_way_create(params);
    #This will calculate the tax rate and return it
    start_the_tax_calculations(@id_info_searcher)
    
    #This allows this function to be called with ajax and render nothing on the web page
    render :nothing => true, :status => 200, :content_type => 'json' 
  end    
  
  def sendInputData
    puts params
    array_to_store_html_elements = GetInputData::get_data_from_sequel(params)
    @techno = "This is a serious test that works :_)"
    render :json => array_to_store_html_elements#, :status => 200
  end
   
end
