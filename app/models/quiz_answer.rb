class QuizAnswer < ApplicationRecord
  belongs_to :quiz_question
  belongs_to :quiz_attempt
  belongs_to :quiz_option
end
