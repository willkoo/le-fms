class RemoveColumnFromCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :company_profiles, :verified
  end
end
