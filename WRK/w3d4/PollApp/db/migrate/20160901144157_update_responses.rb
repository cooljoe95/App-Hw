class UpdateResponses < ActiveRecord::Migration
  def change
    remove_index(:responses, :question_id)
    remove_column(:responses, :question_id)
  end
end
