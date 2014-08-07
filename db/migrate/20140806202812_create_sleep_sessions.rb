class CreateSleepSessions < ActiveRecord::Migration
  def change
    create_table :sleep_sessions do |t|
      t.integer :deep
      t.integer :times_woken
      t.integer :total
    end
  end
end
