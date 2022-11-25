class Franchise < ApplicationRecord
  belongs_to :user
  has_many :licences
  has_many :approved_franchises
  has_many :quizzes
  has_many :partners
end
