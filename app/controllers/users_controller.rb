class UsersController < Clearance::UsersController
  private
  def url_after_create
    new_food_preference_path
  end
end
