class CreateCompanyComments < ActiveRecord::Migration[7.0]
  def change
    create_table :company_comments do |t|
      t.string :content, null: false
      t.references :company_profiles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
