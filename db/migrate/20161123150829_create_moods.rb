class CreateMoods < ActiveRecord::Migration[5.0]
  def change
    create_table :moods do |t|
      t.time  :mood_pace
      t.string :mood_experience
      t.float  :desired_distance
      t.references :user, null: false
      t.timestamps(null: false)
    end
  end
end
