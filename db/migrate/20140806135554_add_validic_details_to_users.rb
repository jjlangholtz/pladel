class AddValidicDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :token, :string
  end
end
