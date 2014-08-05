class FoodsController < ApplicationController
  def new
    @current_user = current_user
  end

  def edit
    @current_user = current_user
  end
end
