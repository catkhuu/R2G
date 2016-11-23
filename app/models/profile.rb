class Profile < ApplicationRecord
  belongs_to :user
  validates :why_i_run, length: { maximum: 140 }
  validates :user_pace, :experience, :user_id, presence: true
  validates :goals, length: { minimum: 15, maximum: 200 }, presence: true
  validates :need_to_knows, length: { maximum: 200 }
end
