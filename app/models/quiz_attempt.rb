class QuizAttempt < ApplicationRecord
  belongs_to :partner
  has_many :quiz_answers
end
