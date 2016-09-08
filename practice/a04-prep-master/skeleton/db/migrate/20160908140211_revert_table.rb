class RevertTable < ActiveRecord::Migration
  def change
    remove_column :links, :user
    add_column :links, :user_id, :integer
  end
end
