class Run < ApplicationRecord
  belongs_to :runner, foreign_key: :runner_id, class_name: :User
  belongs_to :companion, foreign_key: :companion_id, class_name: :User, optional: true
  has_one :runner_mood, through: :runner, source: :moods

  def run_hours
  end

  def run_minutes
  end

  def run_daypart
  end
  validates :runner_id, :run_date, :time, :zipcode, presence: true
end
