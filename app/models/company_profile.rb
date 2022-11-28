class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences

  has_one_attached :acra
  has_one_attached :financial_statement
  has_one_attached :relevant_licences

  validates :name, :uen, :address, :status, :url, :paid_up_capital, :last_fy_revenue, :legal_disputes, presence: true
  validates :status, inclusion: { in: %w[pending verified] }
end
