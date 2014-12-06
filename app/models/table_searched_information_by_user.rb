class TableSearchedInformationByUser < ActiveRecord::Base
  belongs_to :table_searcher_personal_informations
  has_many :table_answer_to_information_txc
  validates :income_size, presence: true
  validates :income_currency, presence: true
  validates :income_source, presence: true  
  validates :income_location_country, presence: true 
end
