module FindTheExchangeRate
    #Later create a way to get it updated and check for what income it needs
    @exchange_rate_to_sterling_pound = {
      "Pound_Sterling" => 1,
      "Euro" => 1,
    };
    
    def FindTheExchangeRate::exhange_rate_to_sterling_pound(currency)
      return @exchange_rate_to_sterling_pound[currency];
    end
end