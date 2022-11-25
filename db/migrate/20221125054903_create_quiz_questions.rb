class CreateQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_questions do |t|
      t.string :question
      t.string :correct_option
      t.string :wrong_option_one
      t.string :wrong_option_two
      t.string :wrong_option_three
      t.references :quiz, null: false, foreign_key: true
      t.timestamps
    end
  end
end
