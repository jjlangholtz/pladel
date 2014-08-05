class RemoveUserRefFromFoods < ActiveRecord::Migration
  def change
    remove_reference :foods, :user, index: true
  end
end
