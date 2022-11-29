class Quiz < ApplicationRecord
  belongs_to :franchise
  has_many :quiz_questions
  has_many :quiz_attempts

  # validates :quiz_name, :franchise_id, :video_url, :video_completed, presence: true
end
