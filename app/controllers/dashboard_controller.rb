class DashboardController < ApplicationController
  def index
    current_user.get_routine_sessions
    current_user.get_sleep_sessions
  end
end
