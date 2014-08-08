class DashboardsController < ApplicationController
  def show
    current_user.get_routine_sessions
    current_user.get_sleep_sessions
  end
end
