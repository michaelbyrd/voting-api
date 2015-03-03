class Api::V1::VotersController < ApplicationController
  def index
    if params[:party]
      voters = Voter.where(party: params[:party])
    else
      voters = Voter.all
    end
    render json: voters
  end
end
