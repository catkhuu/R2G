class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :moods
  has_many :runs
  has_many :runs_as_companion, foreign_key: :companion_id, class_name: :Run

end
