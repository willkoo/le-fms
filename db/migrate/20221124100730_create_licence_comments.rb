class CreateLicenceComments < ActiveRecord::Migration[7.0]
  def change
    create_table :licence_comments do |t|
      t.string :content, null: false
      t.references :licence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
