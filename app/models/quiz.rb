class Quiz < ApplicationRecord
  belongs_to :franchise
  has_many :quiz_questions
end
