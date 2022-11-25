class Partner < ApplicationRecord
  belongs_to :licence
  belongs_to :franchise
  has_many :quiz_attempts
end
