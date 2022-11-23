class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences
end
