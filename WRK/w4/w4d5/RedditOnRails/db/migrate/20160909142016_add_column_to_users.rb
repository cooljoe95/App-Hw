class AddColumnToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :password_digest
    remove_column :users, :session_token

  end
end
