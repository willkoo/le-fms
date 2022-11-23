class Profile < ApplicationRecord
  belongs_to :user
  has_many :approved_franchises
end
