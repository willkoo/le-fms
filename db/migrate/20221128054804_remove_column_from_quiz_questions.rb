class RemoveColumnFromQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_questions, :correct_option
    remove_column :quiz_questions, :wrong_option_one
    remove_column :quiz_questions, :wrong_option_two
    remove_column :quiz_questions, :wrong_option_three
  end
end
