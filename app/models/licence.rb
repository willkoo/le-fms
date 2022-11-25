class Licence < ApplicationRecord
  belongs_to :company_profile
  belongs_to :franchise
  has_many :license_comments
  has_many :partners
end
