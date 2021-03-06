class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :visited_url_id, null: false

      t.timestamps
    end
    
    add_index :visits, :user_id
    add_index :visits, :visited_url_id
  end

end
