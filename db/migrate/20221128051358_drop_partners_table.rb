class DropPartnersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :partners
  end
end
