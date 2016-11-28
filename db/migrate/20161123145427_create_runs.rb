class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.float   :distance
      t.time    :run_time
      t.time    :run_pace
      t.references :runner, null: false
      t.references :companion
      t.string   :run_date, null: false
      t.integer     :time, null: false
      t.integer    :zipcode

      t.timestamps(null: false)
    end
  end
end
