class AddContractSignedToLicences < ActiveRecord::Migration[7.0]
  def change
    add_column :licences, :contract_signed, :boolean, default: false
  end
end
