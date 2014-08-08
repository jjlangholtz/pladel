class ChangeDetailsMovementSessions < ActiveRecord::Migration
  def change
    remove_column :movement_sessions, :calories_burned, :integer
    remove_column :movement_sessions, :distance, :integer
    add_column :movement_sessions, :steps, :float
  end
end
