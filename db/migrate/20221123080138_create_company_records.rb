class CreateCompanyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :company_records do |t|
      t.references :company_profile, null: false, foreign_key: true
      t.string :paid_up_capital, null: false
      t.string :last_fy_revenue, null: false
      t.string :legal_disputes, null: false

      t.timestamps
    end
  end
end
