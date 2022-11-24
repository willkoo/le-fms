class DeleteCompanyRecords < ActiveRecord::Migration[7.0]
  def change
    drop_table :company_records
  end
end
