class Franchise < ApplicationRecord
  belongs_to :user
  has_many :licence
end
