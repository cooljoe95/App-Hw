class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null:false
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :user_id
  end
end
