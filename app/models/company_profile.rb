class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences
  has_many :company_records

  validates :name, :uen, :address, :status, :url, presence: true
  validates :status, inclusion: { in: %w[pending accepted rejected] }
end
