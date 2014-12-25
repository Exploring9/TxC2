class CreateAllowanceIncomeInstanceObjectNumber
  attr_accessor :name_of_allowance, :size_of_allowance, :location_of_allowance,:currency_of_allowance,:income_object_relation
  
  def initialize
    @name_of_allowance = "string"
    @size_of_allowance = "integer"
    @location_of_allowance = "string"
    @currency_of_allowance = "string"
    @income_object_relation = "data_structure"
  end
end