class CreateMovementSessions < ActiveRecord::Migration
  def change
    create_table :movement_sessions do |t|
      t.integer :distance
      t.integer :calories_burned
      t.belongs_to :user, index: true
    end
  end
end
