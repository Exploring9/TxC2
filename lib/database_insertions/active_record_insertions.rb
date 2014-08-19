module ActiveRecordInsertions
  # Do I need it?
  #attr_reader :legal_entity, :sizes_of_income, :types_of_income, :locations_of_income
  
  def active_records_way_create(params)
      puts "This is residence in the rails_way_create"
      puts params
      puts JSON.parse(params[:sizes_of_income]);
      puts JSON.parse(params[:sizes_of_income]).class;
      
      legal_entity = TableSearcherPersonalInformation.create(residence: params[:residence])

      sizes_of_income = JSON.parse(params[:sizes_of_income]);
      types_of_income = JSON.parse(params[:types_of_income]);
      locations_of_income = JSON.parse(params[:locations_of_income]);
  
      sizes_of_income.each_index do |array_number| 
        TableSearchedInformationByUser.create(table_searcher_personal_information_id: legal_entity.id,
         sizes_of_income: sizes_of_income[array_number],
         types_of_income: types_of_income[array_number],
         locations_of_income: locations_of_income[array_number]);
    end
    return_the_current_id(legal_entity);
  end
  
  def return_the_current_id(legal_entity)
    #This is the legal_entity.id (to_s makes a string out of an integer)
    puts "This is the legal_entity_id:" + legal_entity.id.to_s
    return legal_entity.id
  end
  
end