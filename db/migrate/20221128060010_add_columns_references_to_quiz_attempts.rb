class AddColumnsReferencesToQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    add_reference :quiz_attempts, :licence, index: true, foreign_key: true
    add_reference :quiz_attempts, :quiz, index: true, foreign_key: true\

    add_column :quiz_attempts, :passed, :boolean, default: false
  end
end
