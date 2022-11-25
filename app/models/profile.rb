class Profile < ApplicationRecord
  belongs_to :user
  has_many :approved_franchises
  has_many :company_profile
end
