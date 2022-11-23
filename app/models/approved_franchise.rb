class ApprovedFranchise < ApplicationRecord
  belongs_to :profile
  belongs_to :franchise
end
