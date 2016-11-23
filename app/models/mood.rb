class Mood < ApplicationRecord
  belongs_to :user
  has_many :runs, through: :user, source: :runs 
end
