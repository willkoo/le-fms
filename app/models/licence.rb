class Licence < ApplicationRecord
  belongs_to :company_profile
  belongs_to :franchise
  has_many :license_comments

  has_many :partners
  has_one_attached :proposal

  validates :company_profile_id, :franchise_id, :proposed_location, :licence_status, presence: true
  validates :licence_status, inclusion: { in: %w[approve reject pending] }
end
