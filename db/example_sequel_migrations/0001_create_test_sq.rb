=begin
Sequel.migration do
  up do
    create_table(:test_sq) do
      Integer :id_test, :null => false
      String :name_test, :size => 45, :null => false
      
      primary_key[:id_test, :name_test]
      
    end
  end
  
  down do
    drop_table(:test_sq)
  end
end

puts "This is a migration file"
=end

#This is to test out sequel migrations