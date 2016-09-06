class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.integer :age, null: false
      t.string :color, inclusion: ['Black', 'White', 'Organge', 'Brown'], null: false
      t.string :name, null: false
      t.string :sex, limit: 1, inclusion: ['M', 'F']
      t.text :description, null: false

      t.timestamps
    end

    add_index(:cats, :name)
  end
end
