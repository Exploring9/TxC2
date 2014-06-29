class TaxCalculatorController < ApplicationController
  def index
  end
  
  def personalAndTaxInfo
    puts "This is the personalInfo method - the params received:"+params.inspect
    puts "This is the request body:"+ request.body.read
    residence = params[:personal];
    sizesOfIncomeArray = params[:sizesOfIncome].delete("^0-9,").split(",").map{ |x| x.to_i};
    typesOfIncomeArray = params[:typesOfIncome].delete("^a-zA-Z,").split(",");
    locationsOfIncomeArray = params[:locationsOfIncome].delete("^a-zA-Z,").split(",");
    #This allows this function to be called with ajax and render nothing on the web page
    render :nothing => true, :status => 200, :content_type => 'html' 
    storeResults();
    linkInfo();
    # Create these later myself
    #PersonObjectCreator.new(params[:personal]);
    #TotalIncomeObjectCreator.new(sizesOfIncomeArray,typesOfIncomeArray,locationsOfIncomeArray)
  end
  
  #This is just method for testing a simple thing
  def linkInfo
    puts "You are in linkInfo method"
  end
  
  def storeResults
    #Access the MySQL DB and store the results here
    
  end
  
end


### Comments so that I get it later 
=begin #Access MySQL
   participant = ActiveRecord::Base.connection.execute("SELECT * FROM Table_Info;")
     puts participant.inspect
     puts participant.count
     puts participant.methods
     participant.each do |results|
   puts results
=end
### To get the parameters that are sent to me from ajax JSON file, I need to use
### params[:nameOftheParameterInAjax]
# Javascript sends an array and ruby splits it with @astring.split(",")

### Bug Fix:  ### 

###  ### That is why I need to get rid of all the comma in the website when they are sending me the array!!! 