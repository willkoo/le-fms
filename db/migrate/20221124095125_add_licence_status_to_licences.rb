class AddLicenceStatusToLicences < ActiveRecord::Migration[7.0]
  def change
    add_column :licences, :licence_status, :string, default: 'pending', null: false
  end
end
