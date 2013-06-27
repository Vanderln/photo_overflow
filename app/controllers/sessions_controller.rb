class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now.alert = "Invalid email or password"
      render login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
