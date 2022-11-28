class RemoveColumnsFromQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_attempts, :quiz_score
    remove_column :quiz_attempts, :quiz_status
  end
end
