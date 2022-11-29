class QuizAttempt < ApplicationRecord
  belongs_to :licence
  belongs_to :quiz
  has_many :quiz_answers

  # validates :licence_id, :quiz_id, :passed, presence: true
end
