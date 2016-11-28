class AddDesiredDistanceColumnToRuns < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :desired_distance, :float
  end
end
