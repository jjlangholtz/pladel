class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      @user.create_active_meals(1)
      redirect_back_or url_after_create
    else
      render template: 'users/new'
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    foods = Food.find(params[:user][:food_ids].reject { |id| id.blank? })
    foods.each { |food| current_user.foods << food }
    redirect_to dashboard_url
  end

  private

  def url_after_create
    dashboard_path
  end
end
