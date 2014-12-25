module InterfaceAccess::ControllingInterest
  
  def self.handshake_controlling_interest(income_instance_object)
    
    result_income_controlling_interest = income_instance_object[:income_controlling_interest]
    
    puts "In InterfaceAccess::ControllingInterest and the value is #{result_income_controlling_interest} => handshake_controlling_interest"
    
    if result_income_controlling_interest == 0 || result_income_controlling_interest == nil
      puts "In InterfaceAccess::ControllingInterest and the value is 0/nil => handshake_controlling_interest"
      
      result_income_controlling_interest = 0
      
      id_controlling_percentage = DB[:Table_grouping_controlling_interest].where(:percentage_controlling_interest => result_income_controlling_interest).all;
      
      puts id_controlling_percentage
      
      id_grouping_interest =  id_controlling_percentage[0][:id_grouping_interest]
      
      id_controlling_interest = DB[:Table_controlling_interest].where(:id_grouping_interest => id_grouping_interest).all;
      
      id_controlling_interest = id_controlling_interest[0][:id_controlling_interest];
      
    else
      
      id_controlling_percentage = DB[:Table_grouping_controlling_interest].where().all#.where(:percentage_controlling_interest => income_instance_object[:income_controlling_interest]).all;
      
      id_controlling_interest = 101
      
    end
    
    return id_controlling_interest    
    
  end
  
end