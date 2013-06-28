class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def profile_questions
    if current_user
      @questions = Question.find_all_by_user_id(current_user.id)
    else
      redirect :root
    end
  end

  def profile_answers
    if current_user
      @answers = Answer.find_all_by_user_id(current_user.id)
    else
      redirect :root
    end
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
    if current_user
      @questions = Question.find_all_by_user_id(current_user.id)
      @myanswers = Answer.find_all_by_user_id(current_user.id)
    else
      redirect :root
    end
  end
end
