class RemoveVerifiedToLicenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :licences, :verified, :boolean
  end
end
