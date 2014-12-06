class CreateTotalTaxObject
  attr_accessor :total_size_of_taxes, :currency_of_taxes, :instances_of_taxes
  
  def initialize 
    @total_size_of_taxes = "integer";
    @currency_of_taxes = "currency";
    @parent_of_taxes = "datastructure";
  end
  
end