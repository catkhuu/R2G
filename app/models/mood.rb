class Mood < ApplicationRecord
  belongs_to :user
  has_many :runs, through: :user, source: :runs

  validates_presence_of :user_id 
end
