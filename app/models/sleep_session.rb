class SleepSession < ActiveRecord::Base
  belongs_to :user

  def score
    (total / 60 ) * ((deep / 60) / (times_woken + 1))
  end
end
