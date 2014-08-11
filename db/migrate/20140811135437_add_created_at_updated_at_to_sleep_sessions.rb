class AddCreatedAtUpdatedAtToSleepSessions < ActiveRecord::Migration
  def change
    add_column :sleep_sessions, :created_at, :datetime
    add_column :sleep_sessions, :updated_at, :datetime
  end
end
