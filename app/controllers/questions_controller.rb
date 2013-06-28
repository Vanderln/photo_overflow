class QuestionsController < ApplicationController
  def new
  end

  def index
    @questions = Question.all
  end

  def create
    p params.inspect
    Question.create(:file => params[:file], :title => params[:title], :content =>params[:content], :user_id => current_user.id)
    redirect_to questions_path
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
    @question_answers = @question.answers
  end

  def ask_question
    if current_user
      redirect_to new_question_path
    else
      redirect_to '/login'
    end
  end

end
