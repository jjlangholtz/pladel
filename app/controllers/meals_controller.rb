class MealsController < ApplicationController
  def create
    new_meals = params[:total_meals].to_i
    on_diet = params[:on_diet].to_i
    off_diet = new_meals - on_diet

    on_diet.times { current_user.meals.create(status: 'complete') }
    off_diet.times { current_user.meals.create(status: 'incomplete') }
    redirect_to dashboard_url
  end
end
