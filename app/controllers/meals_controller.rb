class MealsController < ApplicationController
  def update
    meal = Meal.find(params[:id])
    meal.update_attribute('status', 'complete')
    current_user.create_active_meals(1)
    redirect_to dashboard_url
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.update_attribute('status', 'incomplete')
    current_user.create_active_meals(1)
    redirect_to dashboard_url
  end
end
