class Run < ApplicationRecord
  belongs_to :runner, foreign_key: :runner_id, class_name: :User
  belongs_to :companion, foreign_key: :companion_id, class_name: :User, optional: true
  has_one :runner_mood, through: :runner, source: :moods

  validates :distance, :run_time, :run_pace, :runner_id, presence: true
end
