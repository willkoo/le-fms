class QuizAttempt < ApplicationRecord
  belongs_to :licence
  has_many :quiz_answers
  has_many :quizzes, through: :quiz_answers

  # validates :licence_id, :quiz_id, :passed, presence: true
end
