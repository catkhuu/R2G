class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.integer  :zipcode, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps(null: false)
    end
  end
end
