class RemoveImageFromRuns < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :name, :integer
  end
end
