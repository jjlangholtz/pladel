class MealsController < ApplicationController
  def update
    meal = Meal.last
    meal.update_attribute('status', 'complete')
    current_user.create_active_meals(1)
    respond_to do |format|
      format.js
      format.html { redirect_to dashboard_url }
    end
  end

  def destroy
    meal = Meal.last
    meal.update_attribute('status', 'incomplete')
    current_user.create_active_meals(1)
    respond_to do |format|
      format.js
      format.html { redirect_to dashboard_url }
    end
  end
end
