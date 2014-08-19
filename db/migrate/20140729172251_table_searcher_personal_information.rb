class TableSearcherPersonalInformation < ActiveRecord::Migration
  def up
    create_table :table_searcher_personal_informations do |t|
      t.string :residence
      t.timestamps
    end
  end
  
  def down
    drop_table :table_searcher_personal_informations
  end
end
