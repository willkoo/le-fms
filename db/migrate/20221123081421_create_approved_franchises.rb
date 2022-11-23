class CreateApprovedFranchises < ActiveRecord::Migration[7.0]
  def change
    create_table :approved_franchises do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :franchise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
