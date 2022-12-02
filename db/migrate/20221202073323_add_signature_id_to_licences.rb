class AddSignatureIdToLicences < ActiveRecord::Migration[7.0]
  def change
    add_column :licences, :signature, :string
  end
end
