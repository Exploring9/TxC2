module InterfaceAccess::Currency

 def self.return_name_currency_from_abbreviation_country(abbreviation_country)
   tax_jdn_residence_country = InterfaceAccess::TaxJdn.return_country_id_tax_jdn_from_abbreviation(abbreviation_country);
   
   currency_id = DB[:Table_jurisdiction_currency].where(:id_tax_jurisdiction => tax_jdn_residence_country).all;
   
   currency_id_result = currency_id[0][:id_currency];
   
   country_currency = DB[:Table_currency].where(:id_currency => currency_id_result).all;
   
   name_currency = country_currency[0][:name_currency]
   
   return name_currency
 end
 
end