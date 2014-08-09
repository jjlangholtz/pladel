class MealsController < ApplicationController
  def update
    meal = Meal.find(params[:id])
    meal.update_attribute('status', 'complete')
    redirect_to dashboard_url
  end
end
