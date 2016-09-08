class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :track_name, null: false
      t.string :track_type
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :track_name
  end
end
