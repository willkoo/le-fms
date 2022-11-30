class AddColumnToQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    add_column :quiz_attempts, :status, :string, default: "pending"
  end
end
