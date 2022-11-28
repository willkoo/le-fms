class QuizAttempt < ApplicationRecord
  belongs_to :licence
  has_many :quiz_answers
  has_many :quizzes, through: :quiz_answers
end
