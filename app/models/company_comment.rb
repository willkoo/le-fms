class CompanyComment < ApplicationRecord
  belongs_to :company_profile

  validates :comment, presence: true
end
