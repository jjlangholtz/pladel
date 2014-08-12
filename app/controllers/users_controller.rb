class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      @user.create_active_meals(3)
      redirect_back_or url_after_create
    else
      render template: 'users/new'
    end
  end

  def edit
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
