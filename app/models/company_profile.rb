class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences
  has_one_attached :pdf1
  has_one_attached :pdf2
  has_one_attached :pdf3

  validates :name, :uen, :address, :status, :url, :paid_up_capital, :last_fy_revenue, :legal_disputes, presence: true
  validates :status, inclusion: { in: %w[pending accepted rejected] }
end
