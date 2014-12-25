module InterfaceAccess::TaxJdn 
  
  def self.return_country_id_tax_jdn_from_abbreviation(abbreviation_country)
    country_results = DB[:Table_tax_jurisdiction_country].where(:abbreviation_country => abbreviation_country).all;
    puts "This is country_id_tax_jdn: Country_results =  #{country_results}"
    country_id = country_results[0][:id_tax_jurisdiction];
    puts "This is country_id_tax_jdn: country_id = #{country_id}"
    return country_id
  end
 
  def self.return_state_id_tax_jdn_from_abbreviation(abbreviation_state)
    state_results = DB[:Table_tax_jurisdiction_state].where(:abbreviation_state => abbreviation_state).all;
    puts "This is state_id_tax_jdn: State_results =  #{state_results}"
    if state_results.empty?
      return nil
    else
      state_id = state_results[0][:id_tax_jurisdiction];
      puts "This is state_id_tax_jdn: state_id = #{state_id}"
      return state_id 
    end     
  end 

  def self.return_region_id_tax_jdn_from_abbreviation(abbreviation_region)
    region_results = DB[:Table_tax_jurisdiction_region].where(:abbreviation_region => abbreviation_region).all;
    puts "This is region_id_tax_jdn: region_results =  #{region_results}"
    if region_results.empty?
      return nil
    else
      region_id = region_results[0][:id_tax_jurisdiction];
      puts "This is region_id_tax_jdn: region_id = #{region_id}"
      return region_id   
    end  
  end 
  
  def self.return_area_id_tax_jdn_from_abbreviation(abbreviation_area)
    area_results = DB[:Table_tax_jurisdiction_area].where(:abbreviation_area => abbreviation_area).all;
    puts "This is area_id_tax_jdn: area_results =  #{area_results}"
    if area_results.empty?
      return nil
    else
      area_id = area_results[0][:id_tax_jurisdiction];
      puts "This is area_id_tax_jdn: area_id = #{area_id}"
      return area_id       
    end    
  end 
  
end