class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences
  has_many :company_records
end
