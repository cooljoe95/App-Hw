class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sub_id, :integer
    Post.all.each do |post|
      post.sub_id = 0
      post.save!
    end

    change_column :posts, :sub_id, :integer, :null => false
  end
end
