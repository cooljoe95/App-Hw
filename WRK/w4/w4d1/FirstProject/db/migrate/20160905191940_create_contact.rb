class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false, unique: {scope: :email}
    end
    add_index :contacts, :user_id
  end

end
