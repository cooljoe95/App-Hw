class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.integer :moderator_id, null: false
      t.text :description, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
