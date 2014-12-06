module InterfaceAccess::Citizenship
  
  def self.handshake_get_id_citizenship_from_citizenship(citizenship)
    puts "This is handshake_citizenship";
    puts citizenship 
    if citizenship == ""
      id_citizenship_result = 1; #This means that the person doesn't have a citizenship
    else
      #This will need to be set by the database later:
      id_citizenship = DB[:Table_citizenship].where(:abbreviation_country => citizenship).all; #This can easily be set by the DB
      puts id_citizenship
      id_citizenship_result = id_citizenship[0][:id_citizenship];
    end
   puts "This is @id_citizenship in create_searcer_object.rb"
   return id_citizenship_result;    
  end
  
end