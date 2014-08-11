class RemoveMealsPerDayFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :meals_per_day, :integer
  end
end
