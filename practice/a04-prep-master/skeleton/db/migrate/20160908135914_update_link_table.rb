class UpdateLinkTable < ActiveRecord::Migration
  def change
    remove_column :links, :user_id
    add_column :links, :user, :integer
  end
end
