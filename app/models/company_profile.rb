class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences
  has_many :company_records

  validates :status, inclusion: { in: %w[pending accepted rejected] }
end
