class Quiz < ApplicationRecord
  belongs_to :franchise
  has_many :quiz_questions, dependent: :destroy
  has_many :quiz_attempts, dependent: :destroy

  # validates :quiz_name, :franchise_id, :video_url, :video_completed, presence: true

  def passed?
    quiz_attempts.pluck(:status).include?("pass")
  end
end
