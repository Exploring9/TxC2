class TableDetailedAnswerToInformationTxc < ActiveRecord::Migration
  def up
    create_table :table_detailed_answer_to_information_txc do |t|
      t.integer :table_answer_to_information_txc_id
      t.string :tax_name
      t.string :tax_jurisdiction
      t.integer :tax_liability
      t.timestamps
    end 
    add_foreign_key(:table_detailed_answer_to_information_txc, :table_answer_to_information_txc, name: 'fk_1t_dtd_ans_to_inf_txc_2t_ans_to_inf_txc_K_t_ans_to_inf_txc_id')
  end
  
 
  def down
    remove_foreign_key(:table_detailed_answer_to_information_txc, :table_answer_to_information_txc, name: 'fk_1t_dtd_ans_to_inf_txc_2t_ans_to_inf_txc_K_t_ans_to_inf_txc_id')
    drop_table :table_detailed_answer_to_information_txc
  end
end
