require_relative '../../fetch_data_from_database/interface_access'

class CreateSearcherObject
  include InterfaceAccess
  attr_reader :searcher_id, :residence_country, :id_residence_country, :residence_state, :id_residence_state, :residence_region, :id_residence_region, :residence_area, :id_residence_area, :citizenship, :marital_status, :birthday , :number_of_income, :residence_country, :residence_currency, :id_personal_characteristics
  
  #This will store the links to the other classes such as CreateTotalIncomeObject, CreateTotalTaxObject, CreateTotalAllowanceObject
  attr_accessor :parent_of_economic_activity
  
  def initialize(object_id)
    @searcher_object_information = TableSearcherPersonalInformation.find(object_id);
    puts "This is CreateSearcherObject: And I am getting the object from the DB";
    puts @searcher_object_information.inspect;    
    
    @searcher_id = @searcher_object_information.id;
    @residence_country = @searcher_object_information.residence_country;
    @id_residence_country = InterfaceAccess::TaxJdn.return_country_id_tax_jdn_from_abbreviation(@residence_country);
    @residence_state = @searcher_object_information.residence_state;
    @id_residence_state = InterfaceAccess::TaxJdn.return_state_id_tax_jdn_from_abbreviation(@residence_state);
    @residence_region = @searcher_object_information.residence_region;
    @id_residence_region = InterfaceAccess::TaxJdn.return_region_id_tax_jdn_from_abbreviation(@residence_region);
    @residence_area = @searcher_object_information.residence_area;
    @id_residence_area = InterfaceAccess::TaxJdn.return_area_id_tax_jdn_from_abbreviation(@residence_area);
    
    @citizenship = @searcher_object_information.citizenship;
    @marital_status = @searcher_object_information.marital_status;
    @birthday = @searcher_object_information.birthday;
    
    
    #The class will end here the rest will go into their own classes   
    @number_of_income = TableSearchedInformationByUser.where(table_searcher_personal_information_id: @searcher_id).inspect.split.count("table_searcher_personal_information_id:");

    puts "This is the @number_of_income:"
    puts @number_of_income
    
    @residence_currency = InterfaceAccess::Currency.return_name_currency_from_abbreviation_country(@residence_country);
    
    puts "This is @residence_currency"
    puts @residence_currency.inspect;
    
    #This is to get the needed parameters from the DB to create the handshakes (i.e. moving one
    # table above to create )
    @id_citizenship = InterfaceAccess::Citizenship.handshake_get_id_citizenship_from_citizenship(@citizenship);
    
    @id_marital_status = InterfaceAccess::PersonalDetails.handshake_marital_status();# This returns 1
    
    @id_age = InterfaceAccess::PersonalDetails.handshake_age();# This returns 1
    
    @id_personal_characteristics = InterfaceAccess::PersonalCharacteristics.handshake_return_personal_characteristics_from_data(@id_citizenship,@id_marital_status,@id_age);
    
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