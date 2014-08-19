# Basic code to get Sequel to work => begin
require "yaml"
require "sequel"
require_relative "test2"
file_path = File.expand_path "../../config/sequel_database.yaml",__FILE__
file = YAML.load_file(file_path);
DB = Sequel.connect(file)
# => End of the code
puts file

puts DB[:Table_tax_jurisdiction].all
#DB.extension :schema_dumper
#puts DB.dump_schema_migration();
testing_sequel

table_tax_jurisdiction = DB[:Table_tax_jurisdiction]

puts table_tax_jurisdiction.first