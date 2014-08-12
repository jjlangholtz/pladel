class AddActiveToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :active, :boolean, default: true
  end
end
