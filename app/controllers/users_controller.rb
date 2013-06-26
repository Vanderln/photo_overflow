class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user] = @user
      redirect_to index
    else
      render new_user_path
    end
  end
end
