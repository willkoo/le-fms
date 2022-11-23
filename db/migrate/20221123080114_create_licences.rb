class CreateLicences < ActiveRecord::Migration[7.0]
  def change
    create_table :licences do |t|
      t.references :company_profile, null: false, foreign_key: true
      t.references :franchise, null: false, foreign_key: true
      t.text :proposed_location
      t.boolean :verified

      t.timestamps
    end
  end
end
