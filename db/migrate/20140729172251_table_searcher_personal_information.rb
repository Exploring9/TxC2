class TableSearcherPersonalInformation < ActiveRecord::Migration
  def up
    create_table :table_searcher_personal_informations do |t|
      t.string :residence_country
      t.string :residence_state
      t.string :residence_region
      t.string :residence_area
      t.string :citizenship
      t.string :marital_status
      t.date :birthday
      t.integer :number_of_children
      t.timestamps
    end
  end
  
  def down
    drop_table :table_searcher_personal_informations
  end
end
