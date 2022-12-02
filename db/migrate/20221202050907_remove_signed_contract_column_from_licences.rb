class RemoveSignedContractColumnFromLicences < ActiveRecord::Migration[7.0]
  def change
    remove_column :licences, :signed_contract
  end
end
