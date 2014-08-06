class AddPidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pid, :string
  end
end
