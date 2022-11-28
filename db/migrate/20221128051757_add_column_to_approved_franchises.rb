class AddColumnToApprovedFranchises < ActiveRecord::Migration[7.0]
  def change
    add_column :approved_franchises, :partner_status, :boolean, default: false, null: false
  end
end
