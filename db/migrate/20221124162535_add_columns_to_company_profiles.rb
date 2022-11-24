class AddColumnsToCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :company_profiles, :paid_up_capital, :string, null: false
    add_column :company_profiles, :last_fy_revenue, :string, null: false
    add_column :company_profiles, :legal_disputes, :string, null: false
  end
end
