class FoodPreferencesController < ApplicationController
  def new
    @preferences = FoodPreference.new
  end

  def create
    redirect_to new_device_path
  end
end
