class AddTimestampsToSleepSessions < ActiveRecord::Migration
  def change
    add_column :sleep_sessions, :timestamp, :string
  end
end
