class AddUserRefToFoods < ActiveRecord::Migration
  def change
    remove_reference :foods, :food_preference, index: true
    add_reference :foods, :user, index: true
  end
end
