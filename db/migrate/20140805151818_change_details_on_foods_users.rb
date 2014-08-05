class ChangeDetailsOnFoodsUsers < ActiveRecord::Migration
  def change
    remove_column :foods_users, :part_id, :integer
    add_column :foods_users, :user_id, :integer
  end
end
