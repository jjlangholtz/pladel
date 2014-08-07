class SleepSession < ActiveRecord::Base
  belongs_to :user

  def score
    (total / 60 ) * ((deep / 60) / (times_woken + 1))
  end

  def get_sleep_sessions
    client = Validic::Client.new
    sleep = client.get_sleep(user_id: user.uid, start_date: '2014-08-01T00:00:00+00:00')
    sleep_sessions = sleep["sleep"]

    sleep_sessions.each do |s|
      self.total = sleep["sleep"]["total_sleep"]
      self.times_woken = ["sleep"]["times_woken"]
      self.deep = ["sleep"]["deep"]
      save!
    end
  end
end
