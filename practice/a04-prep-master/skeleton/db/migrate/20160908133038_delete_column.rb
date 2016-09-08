class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :session_token, :string
    add_index :users, :session_token, unique:true

  end
end
