class TableSearchedInformationByUser < ActiveRecord::Base
  belongs_to :table_searcher_personal_informations
  has_many :table_answer_to_information_txc
end
