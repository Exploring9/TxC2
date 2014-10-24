require_relative '../../lib/class_creations/create_searcher_object'
require_relative '../../lib/class_creations/create_tax_instance_object_number'
require_relative '../../lib/class_creations/create_income_instance_object_number'
require_relative '../../lib/class_creations/create_total_income_object'
require_relative '../../lib/tax_calculations_execution/tax_calculations_execution'

module TaxCalculationsStart

  def start_the_tax_calculations(objects_id)
    puts "In the call_the_object_creator"
    # Call the method to create CreateIncomeInstanceObjectNumber 
    # Call a method in module Create object: create the object
    
    @personal_information_searcher_object = CreateSearcherObject.new(objects_id);
    create_income_object_classes(objects_id)
    
    # Call the method that will create the total tax object and tax instance object number
    # I will add all of the tax details needed to execute the tax calculations
    # This is the actual crux of the application 
    # To find the exact information neeeded to calculate the taxes
    create_tax_object_classes(); # I don't need to putin anything since it can access @number_of_income_hash and
    # @total_income_object
    # Call the method in module TaxCalculationsExecution: calculations start
    # Different rules according to how much income the guy has earned
    # Pass in @personal_information_searcher, @total_income_object and @number_of_income_hash
    TaxCalculationsExecution::execute_tax_calculations
  end
  
  def create_income_object_classes(objects_id)
    puts "In create_income_object_classes"
    #puts objects_id
    number_of_income = TableSearchedInformationByUser.where(table_searcher_personal_information_id: objects_id).inspect.split.count("table_searcher_personal_information_id:");    
    # Construction - refactor this later
    
    #We will create separate instances of income in the hash
    @number_of_income_hash = {};  
    for instance in 1..number_of_income do
      @number_of_income_hash[("income_instance_object_"+instance.to_s).to_sym] = CreateIncomeInstanceObjectNumber.new(objects_id,instance);
    end
    
    #We will add all of the income
    @total_income_object = CreateTotalIncomeObject.new(@personal_information_searcher_object,@number_of_income_hash);
  end
  
  def create_tax_object_classes
    
  end
  
end

=begin
#Action Plan
#1st - I need to get all the information #Create an object with it [Complete - 19/08/2014]
# A) Get the ID
# B) Get the residence
# C) Get the number of income
# D) Get their location - type - size


# Half - create the place, where all the results info will be stored [one class or different classes???]
#2nd - I need to find which tax will apply
#A) The residency where the person is based
#B) The location where the income was earned
#C) Resolve the differences
#D) If there is a DTT then special tax applies
#3rd - Once the tax is calculated, I need to put in a nice hash that can be 
#represented easily in a graph
=end