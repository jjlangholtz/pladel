class AddFoodPreferenceRefToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :food_preference, index: true
  end
end
