require_relative '../../lib/class_creations/create_searcher_object'

module TaxCalculationsStart

  def start_the_tax_calculations(objects_id)
    puts "In the call_the_object_creator"
    # Call a method in module Create object: create the object
    all_searched_info = CreateSearcherObject.new(objects_id);
    
    #This is to check whether all income has been added correctly #puts all_searched_info.number_of_income    #puts all_searched_info.size_of_income_nr_1

    # Call the method in module TaxCalculationsExecution: calculations start
    # Different rules according to how much income the guy has earned
  end
   
end

#Action Plan
#1st - I need to get all the information #Create an object with it [Complete - 19/08/2014]
# A) Get the ID
# B) Get the residence
# C) Get the number of income
# D) Get their location - type - size

#2nd - I need to find which tax will apply
#A) The residency where the person is based
#B) The location where the income was earned
#C) Resolve the differences
#D) If there is a DTT then special tax applies
#3rd - Once the tax is calculated, I need to put in a nice hash that can be 
#represented easily in a graph
