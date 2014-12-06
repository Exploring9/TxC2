class TableAnswerToInformationTxc < ActiveRecord::Migration
  def up
    create_table :table_answer_to_information_txc do |t|
      t.integer :table_searched_information_by_user_id
      t.integer :table_searcher_personal_information_id
      t.timestamps
    end 
    add_foreign_key(:table_answer_to_information_txc, :table_searcher_personal_informations, name: 'fk_1_tbl_ans_to_inf_txc_2_tbl_srd_psl_inf_KEY_tbl_srd_psl_inf_id')
    add_foreign_key(:table_answer_to_information_txc, :table_searched_information_by_users, name: 'fk_tbl_ans_to_inf_txc_tbl_srd_inf_by_urs_K_tbl_srd_inf_by_urs_id')
  end
  
 
  def down
    remove_foreign_key(:table_answer_to_information_txc, :table_searcher_personal_informations, name: 'fk_1_tbl_ans_to_inf_txc_2_tbl_srd_psl_inf_KEY_tbl_srd_psl_inf_id')
    remove_foreign_key(:table_answer_to_information_txc, :table_searched_information_by_users, name: 'fk_tbl_ans_to_inf_txc_tbl_srd_inf_by_urs_K_tbl_srd_inf_by_urs_id')
    drop_table :table_answer_to_information_txc
  end
end
