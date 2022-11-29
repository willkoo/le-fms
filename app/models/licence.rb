class Licence < ApplicationRecord
  belongs_to :company_profile
  belongs_to :franchise
  has_many :license_comments

  has_many :quiz_attempts
  has_one_attached :proposal

  validates :company_profile_id, :franchise_id, :proposed_location, :licence_status, presence: true
  validates :licence_status, inclusion: { in: %w[approved reject pending] }
end
