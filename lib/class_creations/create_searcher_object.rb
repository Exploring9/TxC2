class CreateSearcherObject

  attr_accessor :searcher_id, :residence, :number_of_income, :parent_of_economic_activity
  
  def initialize(object_id)
    @searcher_id = TableSearcherPersonalInformation.find(object_id).id;
    @residence = TableSearcherPersonalInformation.find(object_id).residence;
   # The class will end here the rest will go into their own classes   
    @number_of_income = TableSearchedInformationByUser.where(table_searcher_personal_information_id: @searcher_id).inspect.split.count("table_searcher_personal_information_id:");
    
    #puts @number_of_income
  end
end

#Create the things in the object
# A) Get the ID
# B) Get the residence
# C) Get the number of income
# D) Get their location - type - size

#Use this to create a class
#http://rubylearning.com/satishtalim/writing_our_own_class_in_ruby.html
#http://phrogz.net/programmingruby/tut_classes.ht
# This is for creating setter and getter methods that create a class's properties
#http://code.tutsplus.com/tutorials/ruby-for-newbies-working-with-classes--net-15938ml