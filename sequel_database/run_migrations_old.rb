=begin # Not to run it accidently
require "sequel"
require "yaml"
file_path = File.expand_path "../../config/sequel_database.yaml",__FILE__

file = YAML.load_file(file_path);
puts file
DB = Sequel.connect(file)

Sequel.extension :migration
#a = Sequel::Migration.new(db/sequel_migrations)
#a.run(DB, 'db/sequel_migrations')

Sequel::Migrator.run(DB, "../db/sequel_migrations")
=end