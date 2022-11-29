class QuizAnswer < ApplicationRecord
  belongs_to :quiz_question
  belongs_to :quiz_attempt
  belongs_to :quiz_option

  validates :quiz_question_id, :quiz_attempt_id, :quiz_option_id, presence: true
end
