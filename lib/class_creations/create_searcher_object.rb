class CreateSearcherObject

  attr_accessor :searcher_id, :residence, :number_of_income
  
  def initialize(object_id)
    @searcher_id = TableSearcherPersonalInformation.find(object_id).id;
    @residence = TableSearcherPersonalInformation.find(object_id).residence;
    @number_of_income = TableSearchedInformationByUser.where(table_searcher_personal_information_id: @searcher_id).inspect.split.count("table_searcher_personal_information_id:");

    #puts @number_of_income
    
    puts income_array = TableSearchedInformationByUser.where(table_searcher_personal_information_id: @searcher_id).inspect.split(",")
    
    @number_of_income.times do |number|
      instance_of_income(number+1, income_array)
    end
  end
  
  # This is where each different income (i.e: size, type and location) will be added
  # 3 self.class.__send__ :attr_accessor (to create get and set)
  # 3 times __send__ to set the actual variables
  def instance_of_income(number, income_array)
    self.class.__send__(:attr_accessor, "size_of_income_nr_#{number}");
    self.class.__send__(:attr_accessor, "type_of_income_nr_#{number}");
    self.class.__send__(:attr_accessor, "location_of_income_nr_#{number}");
    
    # Equal Sign (=) is there to set the value
    self.__send__("size_of_income_nr_#{number}=", income_array.map.with_index{|x| x.gsub(/[^0-9]/, '').to_i if x[0..15] == " sizes_of_income"}.compact[number-1]);
    
    self.__send__("type_of_income_nr_#{number}=",income_array.map.with_index{|x| x.gsub(/ types_of_income: /, '') if x[0..15] == " types_of_income"}.compact[number-1]);
    
    self.__send__("location_of_income_nr_#{number}=", income_array.map.with_index{|x| x.gsub(/ locations_of_income: /, '') if x[0..20] == " locations_of_income:"}.compact[number-1]);
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