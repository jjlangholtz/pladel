class MealsController < ApplicationController
  def create
    current_user.create_active_meals(1)
    redirect_to dashboard_url
  end

  def update
    meal = Meal.find(params[:id])
    meal.update_attribute('status', 'complete')
    redirect_to dashboard_url
  end
end
