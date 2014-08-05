class UsersController < Clearance::UsersController
  def edit
    @current_user = current_user
  end

  def update
    foods = Food.find(params[:user][:food_ids].reject { |id| id.blank? })
    foods.each { |food| current_user.foods << food }
    redirect_to new_device_path
  end

  private

  def url_after_create
    new_food_path
  end
end
