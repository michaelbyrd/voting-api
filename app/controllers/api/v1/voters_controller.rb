class Api::V1::VotersController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    if params[:party]
      voters = Voter.where(party: params[:party])
    else
      voters = Voter.all
    end
    render json: voters
  end

  def create
    v = Voter.create(name: params[:name], party: params[:party])
    # v = Voter.create(voter_params)
    render json: Voter.all, status: :created
  end

  # private def voter_params
  #   params.require(:voter).permit(:name, :party)
  # end
end
