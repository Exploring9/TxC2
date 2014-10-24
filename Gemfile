source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#This is to access the mysql database:
gem "mysql2"
#gem "sequel-rails" #comment it out when you want to work on active records
gem "awesome_print"
gem "tiny_tds"
#gem "pg" #comment it out after connecting to postgresql
# This is for json parsers to work
gem 'json'
# This is for sequel to work
gem 'sequel'
# This is for yaml to work (old version based on psych)
#gem 'yaml' # I guess I need to require it

#This is to include the gem that will alow automatic creation of foreign keys
gem 'foreigner'

#This is so that I can use the JQUERY DATEPICKER (THE HTML INPUT=DATE as of 28/09/2014 doesn't work)
gem 'jquery-ui-rails'

#This is for test driven development: RSPEC
group :development, :test do 
  gem 'rspec-rails' 
  gem 'factory_girl_rails' 
end 

group :test do 
  gem 'faker' 
  gem 'capybara' 
  gem 'guard-rspec' 
  gem 'launchy' 
end 
#End of testing
#- See more at: http://everydayrails.com/2012/03/12/testing-series-rspec-setup.html#sthash.g3Z2nc9r.dpuf