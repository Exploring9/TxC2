require_relative '../../lib/class_creations/create_searcher_object' #This is to create CreateSearcherObject.new
require_relative '../../lib/class_creations/create_tax_instance_object_number'
require_relative '../../lib/class_creations/create_income_instance_object_number' #This is to create CreateIncomeInstanceObjectNumber.new
require_relative '../../lib/class_creations/create_total_income_object' #This is to create CreateTotalIncomeObject.new
require_relative '../../lib/tax_calculations_execution/tax_calculations_execution'
require_relative '../../lib/class_creations/create_tax_instance_object_number'

module TaxCalculationsStart
  #objects_id is the id number to find all of the information put in the DB_Testing_User with active records
  def TaxCalculationsStart::start_the_tax_calculations(objects_id)
    puts "In the call_the_object_creator"
    # Call the method to create CreateIncomeInstanceObjectNumber 
    # Call a method in module Create object: create the object
    @number_of_income_hash = {};  
    @number_of_tax_hash = {};
    @total_income_object = "";
    @personal_information_searcher_object = CreateSearcherObject.new(objects_id);
    #This is to create all of the income object classes
    TaxCalculationsStart::create_income_object_classes(objects_id);
    TaxCalculationsStart::create_total_income_object_classes();
    
    #This is to create all of the tax instances
    TaxCalculationsStart::create_tax_object_classes(objects_id)
    
    #This is to add up all of the taxes -> then I will create allowances
  end
  
  def TaxCalculationsStart::create_income_object_classes(objects_id)
    puts "In create_income_object_classes (below is objects_id - a passed parameter)"
    puts objects_id;

    #We will create separate instances of income in the hash
    for instance in 1..@personal_information_searcher_object.number_of_income do
      @number_of_income_hash[("income_instance_object_"+instance.to_s).to_sym] = CreateIncomeInstanceObjectNumber.new(objects_id,instance);
    end
    
    
    puts "This is @number_of_income_hash"
    puts @number_of_income_hash
    
  end
  
  def TaxCalculationsStart::create_total_income_object_classes()
    #We will add all of the income
    @total_income_object = CreateTotalIncomeObject.new(@number_of_income_hash,@personal_information_searcher_object);    
  end
  
  def TaxCalculationsStart::create_tax_object_classes(objects_id)
    puts "This is the TaxCalculationsStart::create_tax_object_classes()"
    number_of_income_array = @number_of_income_hash.to_a
    puts number_of_income_array;
    puts number_of_income_array.inspect;
    for instance in 1..@number_of_income_hash.length do
      income_hash_info = number_of_income_array[instance-1][1]
      @number_of_tax_hash[("tax_instance_object_"+instance.to_s).to_sym] = CreateTaxInstanceObjectNumber.new(@personal_information_searcher_object,income_hash_info);
      puts income_hash_info.inspect
    end
  end
  
  def TaxCalculationsStart::create_total_tax_object_class()
    
  end
  
end


# All of the classes:
# 1st - CreateSearcherObject
# 2nd - CreateIncomeInstanceObjectNumber
# 3rd - CreateTotalIncomeObject

##
#Find an object: puts ObjectSpace.each_object(CreateTotalIncomeObject).select{|klass| puts klass.inspect}
#    puts CreateSearcherObject.descendants
##
=begin
#Action Plan on how things will go 
# 1st - Create the Searcher Object that has all of the personal characteristics form the website
# Then also get the necessary information from the Database [PERSONAL CHARACTERISTICS]

# 2nd - Create the Every Single Income Instance (Information from the Website)
# Then get the information information from the DB [LINK TYPE OF TAX AND ECONOMIC ACTIVITY] (SECTOR/SOURCE/PROFESSION)

# 3rd - Create the Total Income Object - that adds all of the income instances
# DB - Nothing

# 4th - Create all of the Tax Instances for each and every single income instance
# DB - Get ID_Type_of_Tax // Performing a check on the residence of income and residence of the searcher
# Decide whether this is locally taxed or through a DTT [if non then it will get taxed twice residence tax and where earned tax] => Except if there are tax credits
# Get the order of the taxes (is not important then use the way the user inputed them)
# Otherwise use the count
# Get the tax id levy

#5th - Perform the tax calculations and return the value to the tax object

#6th - Create the total tax object with all of the taxes added up

#7th - Create a total allowance object that will be used to calculate the allowance - (it is based on residence allowance(Y) and DTT in exceptional cases (Y))

#8th - Create a object that will get all of this information and easy to represent in a graph

#Extra - I will calculate what happens to the taxes if increase the earnings by:
# +1.01 / -0.99 percentage of currency
# +1,1 / -0,9 percentage of currency
# +1.5 /-0.75 percentage of currency
# +2 / -0.5 percentage of currency
# +4 / -0.25 percentage of currency
# +5 / -0.2 percentagoe of currency
# +10 / -0.1 percentage of currency
# +20 / -0.05 percentage of currency
# +50 / -0.02 percentage of currency
# +100 / -0.01 percentage of currency
# +1000 / -0.001 percentage of currency
=> Create a landscape graph for this 
# Analyze the difference [LET THE PERSON CHOOSE WHAT DIFFERENCE TO INVESTAGE TOO]
#DIFF: Do the same with the other countries (earnings)
#DIFF: Do the same for other types of income
#DIFF: Do the same for different types of residency
#PERSONAL DIFFS ALSO
=end