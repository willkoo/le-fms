class AddColumnToFranchises < ActiveRecord::Migration[7.0]
  def change
    add_column :franchises, :description, :text
    add_column :franchises, :url, :string
  end
end
