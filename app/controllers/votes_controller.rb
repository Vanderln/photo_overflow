class VotesController < ApplicationController
  def create
    if current_user
      Vote.create(
        votable_id: params[:votable_id],
        votable_type: params[:votable_type],
        direction: params[:direction], 
        user_id: current_user.id)
    end
    redirect_to :back
  end
end
