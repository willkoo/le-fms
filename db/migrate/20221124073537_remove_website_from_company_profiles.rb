class RemoveWebsiteFromCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :company_profiles, :website
  end
end
