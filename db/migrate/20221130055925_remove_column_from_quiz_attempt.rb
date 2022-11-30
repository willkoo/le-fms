class RemoveColumnFromQuizAttempt < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_attempts, :passed
  end
end
