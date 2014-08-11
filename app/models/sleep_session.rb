class SleepSession < ActiveRecord::Base
  belongs_to :user

  validates :timestamp, uniqueness: { scope: :user_id }

  def score
    score = (total / 60 ) * ((deep / 60) / (times_woken + 1))
    score >= 30 ? 30 : score
  end
end
