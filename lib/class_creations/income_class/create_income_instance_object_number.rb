require_relative '../../fetch_data_from_database/interface_access'

class CreateIncomeInstanceObjectNumber
  attr_reader :income_instance, :income_size, :income_currency, :income_source, :income_location_country, :income_location_id_country, :income_location_state, :income_location_id_state, :income_location_region, :income_location_id_region, :income_location_area, :income_location_id_area, :income_date_earned, :income_assets_holding_period_days, :income_economic_sector, :income_specific_profession, :income_residence_currency, :id_Link_type_of_tax_and_economic_activity, :income_controlling_interest
  
  def initialize(objects_id, instance)
    instance = instance -1;  #This is because the array starts counting from zero
    
    @income_instance_object =  TableSearchedInformationByUser.where(table_searcher_personal_information_id: objects_id)[instance]
    puts "This is CreateIncomeInstanceObjectNumber and will show: @income_instance_object.inspect"
    puts @income_instance_object
    @income_instance = instance+1;
    @income_size = @income_instance_object[:income_size];
    @income_currency = @income_instance_object[:income_currency];
    @income_source = @income_instance_object[:income_source];
    @income_location_country = @income_instance_object[:income_location_country];
    @income_location_id_country = InterfaceAccess::TaxJdn.return_country_id_tax_jdn_from_abbreviation(@income_location_country);
    
    @income_location_state = @income_instance_object[:income_location_state];
    @income_location_id_state = InterfaceAccess::TaxJdn.return_state_id_tax_jdn_from_abbreviation(@income_location_state);
    @income_location_region = @income_instance_object[:income_location_region];
    @income_location_id_region = InterfaceAccess::TaxJdn.return_region_id_tax_jdn_from_abbreviation(@income_location_region)
    @income_location_area = @income_instance_object[:income_location_area];    
    @income_location_id_area = InterfaceAccess::TaxJdn.return_area_id_tax_jdn_from_abbreviation(@income_location_area);
    
    @income_date_earned = @income_instance_object[:income_date_earned];
    @income_assets_holding_period_days = @income_instance_object[:income_assets_holding_period_days];
    @income_economic_sector = @income_instance_object[:income_economic_sector];
    @income_specific_profession = @income_instance_object[:income_specific_profession];
    @income_controlling_interest = @income_instance_object[:income_controlling_interest]
    
    puts @income_instance_object.inspect    
    
    @income_residence_currency = InterfaceAccess::Currency.return_name_currency_from_abbreviation_country(@income_location_country)
    puts "This is @income_residence_currency"
    puts @income_residence_currency.inspect;


    #This will get the special details about the tax
    puts @income_instance_object.inspect;
    
    @id_controlling_interest = InterfaceAccess::ControllingInterest.handshake_controlling_interest(@income_instance_object); # This is to get the controlling interest that an entity owns
    
    @id_type_of_economic_sector = InterfaceAccess::EconomicDetails.handshake_type_of_economic_sector(@income_instance_object);
    
    @id_type_of_economic_profession = InterfaceAccess::EconomicDetails.handshake_type_of_economic_profession(@income_instance_object);
    
    @id_type_of_economic_source = InterfaceAccess::EconomicDetails.handshake_type_of_economic_source(@income_source);
    
    #This is to get the second part of the hand-shake
    #handshake_Link_economic_activity();
    @id_Link_type_of_tax_and_economic_activity = InterfaceAccess::LinkTaxEconomicActivity.handshake_link_economic_activity(@id_type_of_economic_profession,@id_type_of_economic_source,@id_type_of_economic_sector,@id_controlling_interest)
    
  end
end