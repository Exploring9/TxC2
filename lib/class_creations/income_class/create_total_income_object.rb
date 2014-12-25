require_relative '../../exchange_rate/find_the_exchange_rate' #This is to get the function to load up the exchange rate#

class CreateTotalIncomeObject
  attr_accessor :total_size_of_income, :currency_of_income, :parent_of_income 
  
  include FindTheExchangeRate
  
  def initialize(number_of_income_hash,personal_information_searcher)
    puts "You are in CreateTotalIncomeObject"
    
    puts number_of_income_hash.inspect;
    @personal_information_searcher = personal_information_searcher;
    puts @personal_information_searcher.inspect;
    # The currency of all the income is decided by the residency 
    # Later let the person choose different details
    @total_size_of_income = {}; # This is where all of the added income goes
    @number_of_income_hash = number_of_income_hash; # Super Important
    @personal_residence_currency = personal_information_searcher.residence_currency;
    @list_of_income_by_currency = {}; #This is where the list of currencies is present
    
    #This is to create an array with the list of all the incomes
    put_the_income_and_currency();
    #This is to add up all within the different types of currencies
    currency_match_hash();
    #This is to create the exchange rate object that you can look up
    #This is to calculate the total income of something
    create_total_size_of_income()
  end
  
  def put_the_income_and_currency()
    puts "This is @number_of_income.each{} loop"
    puts @number_of_income_hash.inspect
    @number_of_income_hash.each{|key,value| 
      # This is to add all of the currencies in which the income was earned
      @list_of_income_by_currency[@number_of_income_hash[key].income_currency] = 0;
      # This is to add all of the local currencies of where the income was earned
      @list_of_income_by_currency[@number_of_income_hash[key].income_residence_currency] = 0;
      }
    #This is to add the currency of the jurisdiction in which you live
    @list_of_income_by_currency[@personal_residence_currency] = 0;
  end
  
  def currency_match_hash()
    puts "This is create_total_income_object - method: currency_match_hash";
    @number_of_income_hash.each{|key,value| 
       @list_of_income_by_currency.each_pair{|currency, size_of_income|
            # puts number_of_income_hash[searched_within_income].income_currency; puts currency; puts number_of_income_hash[searched_within_income].income_currency === currency
            if @number_of_income_hash[key].income_currency === currency
              #puts number_of_income_hash[searched_within_income].income_size; #puts number_of_income_hash[searched_within_income].income_size.class; #puts size_of_income; #puts size_of_income.class
              @list_of_income_by_currency[@number_of_income_hash[key].income_currency] = size_of_income + @number_of_income_hash[key].income_size;
            end
       }
    }
    puts @list_of_income_by_currency;
  end
  
  def create_total_size_of_income()
    #This will represent the size of all income in pounds
    @total_size_of_income["Pound_Sterling"] = 0;
    @list_of_income_by_currency.each_pair{|currency, size_of_income|
        puts currency; puts size_of_income;
        if currency === "Pound_Sterling"
          @total_size_of_income["Pound_Sterling"] = @total_size_of_income["Pound_Sterling"] + size_of_income
          puts @total_size_of_income["Pound_Sterling"];
        else
          exchange_rate =  FindTheExchangeRate.exhange_rate_to_sterling_pound(currency);
          @total_size_of_income["Pound_Sterling"] = @total_size_of_income["Pound_Sterling"] + (size_of_income * exchange_rate);
          puts @total_size_of_income["Pound_Sterling"];
        end
    }
    
    # Now convert this number back to all of the other income
        @list_of_income_by_currency.each_pair{|currency, size_of_income|
          exchange_rate =  FindTheExchangeRate.exhange_rate_to_sterling_pound(currency);
          @total_size_of_income[currency] = @total_size_of_income["Pound_Sterling"] * (1 / exchange_rate);
    }
    puts "This is the @total_size_of_income in create_total_income_object.rb"
    puts @total_size_of_income;
  end    
end

##This is a test to get all of the objects present in TxC
#puts ObjectSpace.each_object(Class).select{|klass| puts klass}