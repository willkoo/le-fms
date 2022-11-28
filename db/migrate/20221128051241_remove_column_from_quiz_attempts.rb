class RemoveColumnFromQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_attempts, :partner_id
  end
end
