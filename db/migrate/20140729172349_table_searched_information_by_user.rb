class TableSearchedInformationByUser < ActiveRecord::Migration
  def up
    create_table :table_searched_information_by_users do |t|
      t.string :types_of_income
      t.string :locations_of_income
      t.integer :sizes_of_income
      t.integer :table_searcher_personal_information_id
      t.timestamps
    end 
  end
  
  def down
    drop_table :table_searched_information_by_users
  end
end
