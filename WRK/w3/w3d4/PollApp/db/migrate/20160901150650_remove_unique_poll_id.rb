class RemoveUniquePollId < ActiveRecord::Migration
  def change
    remove_index :questions, :poll_id
    add_index :questions, :poll_id, unique: false
  end
end
