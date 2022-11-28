class RemoveAnswerFromQuizAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :quiz_answers, :answer
  end
end
