class CreateQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_attempts do |t|
      t.integer :quiz_score, null: false
      t.string :quiz_status, null: false
      t.references :partner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
