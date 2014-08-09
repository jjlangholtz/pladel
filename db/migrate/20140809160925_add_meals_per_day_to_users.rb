class AddMealsPerDayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meals_per_day, :integer
  end
end
