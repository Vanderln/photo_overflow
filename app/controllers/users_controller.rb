class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user] = @user
      redirect_to users_path
    else
      render new_user_path
    end
  end
end
