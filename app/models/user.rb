class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :moods
  has_many :runs, foreign_key: :runner_id
  has_many :runs_as_companion, foreign_key: :companion_id, class_name: 'Run'

  validates :name, :location, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true, presence: true
  validates :password, length: { minimum: 8, maximum: 20 }
  validates :password_confirmation, presence: true
end
