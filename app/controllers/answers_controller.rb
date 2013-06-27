class AnswersController < ApplicationController
  def index
    @answers = Answer.order("created_at DESC")
  end

  def new
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:answer][:question_id])
    if Answer.create(params[:answer].merge(:user_id => current_user.id))
      redirect_to question
    else
      render question
    end
  end
end
