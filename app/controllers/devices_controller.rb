class DevicesController < ApplicationController
  def new
  end

  def create
    redirect_to dashboard_index_path
  end
end
