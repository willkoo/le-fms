class AddContractColumnsToLicence < ActiveRecord::Migration[7.0]
  def change
    add_column :licences, :contract_url, :string
    add_column :licences, :signed_contract, :boolean, default: false
  end
end
