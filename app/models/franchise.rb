class Franchise < ApplicationRecord
  belongs_to :user
  has_many :licence
  has_many :approved_franchises
end
