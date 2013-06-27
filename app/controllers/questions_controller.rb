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
    @question = Question.find(params[:id])
  end
end
