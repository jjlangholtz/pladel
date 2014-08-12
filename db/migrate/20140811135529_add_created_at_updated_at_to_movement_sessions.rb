class AddCreatedAtUpdatedAtToMovementSessions < ActiveRecord::Migration
  def change
    add_column :movement_sessions, :created_at, :datetime
    add_column :movement_sessions, :updated_at, :datetime
  end
end
