class AnswersController < ApplicationController
  def index
    @answers = Answer.order("created_at DESC")
  end

  def new
  end

  def create
    answer = Answer.new(params[:answer])
    question = Question.find(params[:question_id])
    question.answers << answer

    if answer.save
      redirect_to question_path(question.id)
    else
      render question_path(question.id)
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @question_answers = Answer.find_all_by_question_id(params[:id])
  end
end
