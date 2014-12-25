module InterfaceAccess::PersonalCharacteristics
  
  def self.handshake_return_personal_characteristics_from_data(id_citizenship,id_marital_status,id_age)
    #This is to get the combo that will let me have the first part of the hand-shake
    id_personal_characteristics = DB[:Table_personal_characteristics].where(:id_citizenship => id_citizenship, :id_marital_status => id_marital_status, :id_age => id_age).all;
    
    id_personal_characteristics_results = id_personal_characteristics[0][:id_personal_characteristics];
    puts "This is id_personal_characteristics in create_searcer_object.rb"
    return id_personal_characteristics_results;
  end
  
end