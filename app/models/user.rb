class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :franchises
  has_one :profile
  has_many :company_profiles, through: :profile
  has_many :licences, through: :company_profiles
end
