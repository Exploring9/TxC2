require_relative 'create_tax_instance_single.rb'
class CreateTaxInstanceObjectNumber

  attr_accessor 
  
  def initialize(personal_information, income_instance,instance_name)
    puts "CreateTaxInstanceObjectNumber - Initialize method"
    @instance_name = instance_name
    equivalent_hash_table() #This is to create all of the equivalents that I will use
    puts personal_information.inspect
    @personal_information = personal_information;
    puts income_instance
    @income_instance = income_instance;
    
    @income_size = @income_instance.income_size;
    @country_location_of_gov_where_tax_was_earned = @income_instance.income_location_country;
    @country_location_of_gov_where_tax_was_earned_id = @income_instance.income_location_id_country
    @country_location_of_gov_person_residence = @personal_information.residence_country;
    @country_location_of_gov_person_residence_id = @personal_information.id_residence_country;
    
    @country_location_match = country_location_match(@country_location_of_gov_where_tax_was_earned,@country_location_of_gov_person_residence)
    
    puts "This is @country_location_match: #{@country_location_match}"
    
    @id_personal_characteristics = @personal_information.id_personal_characteristics
    @id_Link_type_of_tax_and_economic_activity = @income_instance.id_Link_type_of_tax_and_economic_activity
    puts "This is @id_personal_characteristics: #{@id_personal_characteristics} and this is @id_Link_type_of_tax_and_economic_activity #{@id_Link_type_of_tax_and_economic_activity}"
    
    #Get the type of tax and then I get what is the DB
    #Create the function id_type_of_tax
    
    #For DTT - I will need to create a DTT for countries that doesn't exists
    #Factorize the same country match, it is ugly???
    @id_allowance = "N" #This is to put in the DB - Because this is a tax and not an allowance (Y - for allowance)
    show_the_information();
    
    @table_type_of_tax = get_table_id_type_of_tax();
    puts @table_type_of_tax
    
    @tax_order = #@table_type_of_tax[:tax_order]
    puts @tax_order
    
    #Country match
    @country_match = country_location_match(@country_location_of_gov_where_tax_was_earned, @country_location_of_gov_person_residence)
    
    @id_scope_of_tax =# @table_type_of_tax[@country_match[:Tax_Scope]] #It is working
    puts "This is @id_scope_of_tax #{@id_scope_of_tax}"
    
    @time_requirement # = @table_type_of_tax[:time_requirement];
    
    @id_type_of_tax # = @table_type_of_tax[:id_type_of_tax];
    
    @name_of_tax = "string"

    #This will be later calculated
    @size_of_tax = "integer"
    @currency_of_tax = "integer"
    
    show_the_information();
    @testing = get_all_taxes(@table_type_of_tax)
  end
  
  # I will get all of the details except for the size of tax
  # For multiple rates/ licenses I will send a __self.__send__()
  
  def country_location_match(income_country,person_country)
    puts "This is CreateTaxInstanceObjectNumber in country_location_match()"
    #TODO: These are the DB rows that will need to be checked
    if income_country == person_country
      puts @equivalents_taxes["same_country"]
      return @equivalents_taxes["same_country"]
    else
      puts @equivalents_taxes["different_country"]
      return @equivalents_taxes["different_country"]
    end  
  end
  
  def equivalent_hash_table()
    @equivalents_taxes = {
      "same_country" => {:DB => :Link_Tax_jurisdiction_Tax_levies_Type_of_tax, :Tax_Scope => :id_scope_of_tax_resident},
      "different_country" => {:DB => :Link_DTT_tax_type_tax_levies,:Tax_Scope => :id_scope_of_tax_non_resident}
    }
  end  
  
  def get_table_id_type_of_tax()
    #Get this from Type_of_Tax table
    puts @id_Link_type_of_tax_and_economic_activity
    puts DB[:Table_type_of_tax].where().all
    get_type_of_tax = DB[:Table_type_of_tax].where(:id_personal_characteristics => @id_personal_characteristics, :id_Link_type_of_tax_and_economic_activity => @id_Link_type_of_tax_and_economic_activity, :id_allowance => @id_allowance).all
    puts "This is get_id_type_of_tax() in CreateTaxInstanceObjectNumber"
    puts get_type_of_tax.inspect
    puts "Might need to add return get_type_of_tax because there can multiple taxes per income" # Might need to delete this!
    return get_type_of_tax
  end
  
  def get_all_taxes(table_type_of_tax)
    #1st - Calculate the number of possible taxes
    # Get the number from get_type_of_tax
    puts "The number of id_type_of_tax"
    puts table_type_of_tax
    every_id_type_of_tax = []
    table_type_of_tax.each{|id_type_of_tax| every_id_type_of_tax << id_type_of_tax[:id_type_of_tax];}
    @results_get_all_taxes = {}; # Make this into a hash later
    puts every_id_type_of_tax
    alphabet = ("a".."z").to_a
    for id_type_of_tax_x in every_id_type_of_tax
      puts alphabet
      puts alphabet[id_type_of_tax_x-1]; #An array starts from zero!!!
      puts @instance_name
      local_name = (@instance_name.to_s+alphabet[id_type_of_tax_x-1].to_s).to_sym
      @results_get_all_taxes[local_name] = CreateTaxInstanceSingle.new(id_type_of_tax_x, local_name)
      puts @results_get_all_taxes
    end
    for id_type_of_tax_x in every_id_type_of_tax
      puts "This is a loop for get_all_taxes"
      #2nd - Get the number from Link_Tax_jurisdiction_Tax_levies_Type_of_Tax for each id_type_of_tax for each jurisdiction
      #A - Country
      #B - State
      #C - Region
      #D - Area
      puts id_type_of_tax_x
      puts @country_location_of_gov_person_residence_id
      number_of_local_taxes = DB[:Link_Tax_jurisdiction_Tax_levies_Type_of_tax].where(:id_type_of_tax => id_type_of_tax_x, :id_tax_jurisdiction => @country_location_of_gov_person_residence_id).all;
      puts number_of_local_taxes
      puts number_of_local_taxes.class
      puts number_of_local_taxes.length # Returns the correct number of id_tax_levies
      #3rd - Check whether DTTs apply if so then get the number from Link_Dtt_tax_type_tax_levies for each jurisdiction
      # There can only be one DTT between two countries! => Otherwise it joint one has to be constructed
      puts "Part of DTT taxes - get_all_taxes"
      puts @country_location_of_gov_where_tax_was_earned_id
      puts id_type_of_tax_x
      number_of_DTT_taxes = DB[:Table_parties_to_a_DTT].where(:id_tax_jurisdiction_resident => @country_location_of_gov_person_residence_id, :id_tax_jurisdiction => @country_location_of_gov_where_tax_was_earned_id).all;
      if number_of_DTT_taxes.length === 1
        puts number_of_DTT_taxes
        test_hash_DTT = number_of_DTT_taxes[0]
        puts test_hash_DTT
        id_country_earned_DTT = test_hash_DTT[:id_country_earned_DTT]
        puts id_country_earned_DTT
        number_of_tax_levies_DTT = DB[:Link_DTT_tax_type_tax_levies].where(:id_country_earned_DTT => id_country_earned_DTT,:id_type_of_tax => id_type_of_tax_x  ).all;
        puts number_of_tax_levies_DTT.inspect
        puts "The number of DTT tax levies"
        puts number_of_tax_levies_DTT.length
        #This will be used to calculate how many tax single instances need to be created
      end
    end
    puts "Number of local taxes: #{number_of_local_taxes} " # Don't work - local variable scope
    puts "Number of DTT taxes: #{number_of_tax_levies_DTT}" # Don't work - local variable scope
    return #Return the number
  end

  #This is for testing purposes
  def test_match_tax()
    puts DB[@country_match[:DB]].inspect;
    puts DB[@country_match[:DB]];
    puts DB[@country_match[:DB]].where().all;
    
    #TODO further develop this!
    #This is testing for the UK - id_tax_jurisdiction_2
    puts DB[@country_match[:DB]].where(:id_tax_jurisdiction => 2).all;
    circle =  DB[@country_match[:DB]].where(:id_tax_jurisdiction => 2).all;
    puts "This is circle: #{circle}"
    circle.each{|i| puts DB[:Table_tax_levies].where(:id_tax_levies => i[:id_tax_levies]).all}
  end
  
  def show_the_information()
      puts "This is the @personal_information: #{@personal_information}"
      puts "This is the @personal_information: #{@personal_information.inspect}"
      puts "This is the @income_instance: #{@income_instance}"
      puts "This is the @income_instance: #{@income_instance.inspect}"
      puts "This is @id_type_of_tax: #{@id_type_of_tax}"
      puts "This is the @income_size: #{@income_size}"
      puts "This is the @country_location_of_gov_where_tax_was_earned: #{@country_location_of_gov_where_tax_was_earned}"
      puts "This is the @country_location_of_gov_person_residence: #{@country_location_of_gov_person_residence}"
      puts "This is the @id_personal_characteristics: #{@id_personal_characteristics}"
      puts "This is the @id_Link_type_of_tax_and_economic_activity: #{@id_Link_type_of_tax_and_economic_activity}"
      puts "This is @id_allowance: #{@id_allowance}"
      puts "This is @table_type_of_tax: #{@table_type_of_tax}"
      puts "This is @tax_order: #{@tax_order}"
      puts "This is @country_match: #{@country_match}"
      puts "This is @id_scope_of_tax: #{@id_scope_of_tax}"
      puts "This is the @time_requirement: #{@time_requirement}"
      puts "This is the @name_of_tax: #{@name_of_tax}"
      puts "This is the @size_of_tax: #{@size_of_tax}"
      puts "This is the @currency_of_tax: #{@currency_of_tax}"
      puts "This is the @equivalents_taxes: #{@equivalents_taxes}"
  end
end