class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :franchises
  has_many :profiles
  has_many :company_profiles, through: :profiles
  has_many :licences, through: :company_profiles
end
