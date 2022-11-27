class Partner < ApplicationRecord
  belongs_to :licence
  belongs_to :franchise
  has_many :quiz_attempts

  validates :licence_id, :franchise_id, :operational_status, presence: true
  validates :operational_status, inclusion: { in: %w[training operational] }
end
