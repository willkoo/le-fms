class CompanyProfile < ApplicationRecord
  belongs_to :profile
  has_many :licences

  has_many :approved_franchises, through: :profile

  has_one_attached :pdf1
  has_one_attached :pdf2
  has_one_attached :pdf3

  validates :name, :uen, :address, :status, :url, :paid_up_capital, :last_fy_revenue, :legal_disputes, presence: true
  validates :status, inclusion: { in: %w[pending verified] }

  def approved_licences
    licences.where(licence_status: 'approve')
  end

  def pending_licences
    licences.where(licence_status: 'pending')
  end
end
