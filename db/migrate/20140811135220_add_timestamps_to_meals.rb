class AddTimestampsToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :created_at, :datetime
    add_column :meals, :updated_at, :datetime
  end
end
