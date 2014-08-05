class CreateFoodPreferences < ActiveRecord::Migration
  def change
    create_table :food_preferences do |t|
      t.belongs_to :user, index: true
    end
  end
end
