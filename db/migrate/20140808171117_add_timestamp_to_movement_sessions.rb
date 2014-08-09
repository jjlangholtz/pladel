class AddTimestampToMovementSessions < ActiveRecord::Migration
  def change
    add_column :movement_sessions, :timestamp, :string
  end
end
