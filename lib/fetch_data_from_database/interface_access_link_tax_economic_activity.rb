module InterfaceAccess::LinkTaxEconomicActivity
  
  def self.handshake_link_economic_activity(id_type_of_economic_profession,id_type_of_economic_source,id_type_of_economic_sector,id_controlling_interest)
    
    id_Link_type_of_tax_and_economic_activity = DB[:Link_type_of_tax_and_economic_activity].where(:id_type_of_economic_profession => id_type_of_economic_profession,:id_type_of_economic_source => id_type_of_economic_source,:id_type_of_economic_sector =>  id_type_of_economic_sector, :id_controlling_interest => id_controlling_interest).all;
    
    result_id_Link_type_of_tax_and_economic_activity = id_Link_type_of_tax_and_economic_activity[0][:id_Link_type_of_tax_and_economic_activity];
    
    puts "This is @id_Link_type_of_tax_and_economic_activity in create_income_instance_object_number.rb: #{result_id_Link_type_of_tax_and_economic_activity}"
    
    
    return result_id_Link_type_of_tax_and_economic_activity;
  end
  
end