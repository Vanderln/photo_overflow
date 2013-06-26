class QuestionsController < ApplicationController

  def new
  end

  def create
    Question.create(:file => params[:file])
  end
end
