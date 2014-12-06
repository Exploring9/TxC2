class CreateTotalAllowanceObject
  attr_accessor :total_size_of_allowance, :currency_of_allowance, :parent_of_allowance
  
  def initialize
    @total_size_of_allowance = "integer"
    @currency_of_allowance = "string"
    @parent_of_allowance = "datastructure"
  end
  
end