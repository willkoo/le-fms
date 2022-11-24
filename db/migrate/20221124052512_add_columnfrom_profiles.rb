class AddColumnfromProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :country, :text
  end
end
