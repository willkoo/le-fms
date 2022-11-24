class LicenceComment < ApplicationRecord
  belongs_to :licence

  validates :content, presence: true
end
