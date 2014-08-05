class CreateFoodsAndUsers < ActiveRecord::Migration
  def change
    create_table :foods_users, id: false do |t|
      t.belongs_to :food
      t.belongs_to :part
    end
  end
end
