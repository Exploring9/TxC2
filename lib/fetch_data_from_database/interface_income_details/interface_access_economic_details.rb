module InterfaceAccess::EconomicDetails
  
  def self.handshake_type_of_economic_sector(income_instance_object)
    result_income_economic_sector = income_instance_object[:income_economic_sector]
    
    if result_income_economic_sector == ""
      puts "It is empty: @income_instance_object[:income_economic_sector] = #{result_income_economic_sector} in handshake_type_of_economic_sector()"
     #puts DB[:Table_type_of_economic_sector].where(:id_type_of_economic_sector=>1).all;
      type_of_economic_sector = DB[:Table_type_of_economic_sector].where(:id_type_of_economic_sector=>1).all
    else
      
      type_of_economic_sector = DB[:Table_type_of_economic_sector].where(:name_type_of_economic_sector => result_income_economic_sector).all;
    end
    
    puts "This is type_of_economic_sector = #{type_of_economic_sector} in InterfaceAccess::EconomicDetails => handshake_type_of_economic_sector()"
    # The 0 in the array chooses the first option - which is all
    result_id_type_of_economic_sector = type_of_economic_sector[0][:id_type_of_economic_sector];  
    
    return result_id_type_of_economic_sector;   
  end
  
  
  def self.handshake_type_of_economic_profession(income_instance_object)
    result_income_specific_prof = income_instance_object[:income_specific_profession]
    
    if result_income_specific_prof == ""
      puts "It is empty: @income_instance_object[:income_specific_profession] = #{result_income_specific_prof} in handshake_type_of_economic_profession()"
      id_type_of_economic_profession = DB[:Table_type_of_economic_profession].where(:id_type_of_economic_profession => 1).all;
      
    else
      
      id_type_of_economic_profession = DB[:Table_type_of_economic_profession].where(:name_type_of_economic_profession => result_income_specific_prof).all;
    end
    puts "This is @id_type_of_economic_profession = #{id_type_of_economic_profession}in create_income_instance_object_number.rb => handshake_type_of_economic_profession()"
    # The 0 in the array chooses the first option - which is all
    result_id_type_of_economic_profession = id_type_of_economic_profession[0][:id_type_of_economic_profession];   
     
    return result_id_type_of_economic_profession
  end
  
  def self.handshake_type_of_economic_source(income_source)
    id_type_of_economic_source = DB[:Table_type_of_economic_source].where(:name_type_of_economic_source => income_source).all;
    puts "This is @id_type_of_economic_source in InterfaceAccess::EconomicDetails => handshake_type_of_economic_source()"
    puts id_type_of_economic_source
    result_id_type_of_economic_source = id_type_of_economic_source[0][:id_type_of_economic_source];   
    
    return result_id_type_of_economic_source;
  end
end