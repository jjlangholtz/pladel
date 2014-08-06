class AddUserRefToSleepSessions < ActiveRecord::Migration
  def change
    add_reference :sleep_sessions, :user, index: true
  end
end
