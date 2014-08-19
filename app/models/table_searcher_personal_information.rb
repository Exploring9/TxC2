class TableSearcherPersonalInformation < ActiveRecord::Base
  has_many :table_searched_information_by_users
end
