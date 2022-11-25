class CreateQuizAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_answers do |t|
      t.string :answer
      t.references :quiz_question, null: false, foreign_key: true
      t.timestamps
    end
  end
end
