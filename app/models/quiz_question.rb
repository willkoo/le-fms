class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  has_many :quiz_answers
end
