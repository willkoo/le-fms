class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  has_many :quiz_answers, dependent: :destroy
  has_many :quiz_options, dependent: :destroy

  validates :question, :quiz_id, presence: true
end
