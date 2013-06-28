class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user
      redirect_to user_path(current_user)
    else
      render new_user_path
    end
  end

  def show
    @questions = Question.find_by_user_id(current_user.id)
    @answers = Answer.find_by_user_id(current_user.id)
  end
end
