class AddReferenceToQuizAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :quiz_answers, :quiz_attempt, index: true, foreign_key: true
  end
end
