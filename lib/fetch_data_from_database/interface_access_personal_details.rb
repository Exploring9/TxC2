module InterfaceAccess::PersonalDetails
  
  def self.handshake_marital_status()
     return 1; #This can also be easily set by the DB
  end
  
  def self.handshake_age()
    return 1; #Harder to set with a DB
  end
  
end