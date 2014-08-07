class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :status
      t.belongs_to :user, index: true
    end
  end
end
