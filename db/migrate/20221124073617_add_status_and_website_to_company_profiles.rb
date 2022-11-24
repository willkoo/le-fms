class AddStatusAndWebsiteToCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :company_profiles, :status, :string
    add_column :company_profiles, :url, :string
  end
end
