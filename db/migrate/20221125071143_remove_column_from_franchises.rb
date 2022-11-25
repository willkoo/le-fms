class RemoveColumnFromFranchises < ActiveRecord::Migration[7.0]
  def change
    remove_column :franchises, :url
  end
end
