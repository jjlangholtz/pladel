class UsersController < Clearance::UsersController
  def update
    foods = Food.find(params[:user][:food_ids].reject { |id| id.blank? })
    foods.each do |food|
      current_user.foods << food
    end
    redirect_to new_device_path
  end

  private

  def url_after_create
    new_food_path
  end
end
