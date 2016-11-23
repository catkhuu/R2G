class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.float   :distance, null: false
      t.time    :run_time, null: false
      t.time    :run_pace, null: false
      t.references :runner, null: false
      t.references :companion
      t.boolean    :is_solo, default: true
      t.boolean    :is_complete, default: false
      t.timestamps(null: false)
    end
  end
end
