class SessionsController < ApplicationController
  def index
    current_user.get_sleep_sessions
    current_user.get_routine_sessions
    respond_to do |format|
      format.js
      format.html { redirect_to dashboard_path }
    end
  end
end
