class CreateCompanyProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :company_profiles do |t|
      t.string :name, null: false
      t.string :uen, null: false
      t.text :address, null: false
      t.references :profile, null: false, foreign_key: true
      t.string :website
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
