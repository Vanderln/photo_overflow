class VotesController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    question.votes.create(direction: params[:direction], user_id: current_user.id)
    redirect_to question
  end
end
