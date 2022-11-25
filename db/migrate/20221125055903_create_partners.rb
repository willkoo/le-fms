class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :operational_status
      t.references :licence, null: false, foreign_key: true
      t.references :franchise, null: false, foreign_key: true
      t.timestamps
    end
  end
end
