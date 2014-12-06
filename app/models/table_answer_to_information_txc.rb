class TableAnswerToInformationTxc < ActiveRecord::Base
  belongs_to :table_searched_information_by_users
  belongs_to :table_searcher_personal_informations
  has_many :table_detailed_answer_to_information_txc
end