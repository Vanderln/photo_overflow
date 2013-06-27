class QuestionsController < ApplicationController
  def new
  end

  def index
    @questions = Question.all
  end

  def create
    Question.create(:file => params[:file], :title => params[:title], :content =>params[:content])
    redirect_to questions_path
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
    @question_answers = Answer.find_all_by_question_id(params[:id])
  end

end
