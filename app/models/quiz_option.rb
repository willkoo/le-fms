class QuizOption < ApplicationRecord
  belongs_to :quiz_question
  has_many :quiz_answers

  validates :content, :correct_answer, :quiz_question_id, presence: true
end
