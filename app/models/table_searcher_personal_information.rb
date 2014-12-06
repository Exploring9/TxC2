class TableSearcherPersonalInformation < ActiveRecord::Base
  has_many :table_searched_information_by_users
  has_many :table_answer_to_information_txc
  validates :residence_country, presence: true
end
