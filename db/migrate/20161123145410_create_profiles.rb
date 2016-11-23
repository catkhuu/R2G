class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text  :why_i_run, limit: 140
      t.time  :user_pace, null: false
      t.text  :goals, null: false, limit: 200
      t.string :experience, null: false
      t.text  :need_to_knows, limit: 200
      t.references  :user, null: false
      t.timestamps(null: false)
    end
  end
end
