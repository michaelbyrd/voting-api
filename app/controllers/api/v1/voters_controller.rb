class Api::V1::VotersController < ApplicationController
  respond_to :json
  # before_action :restrict_access

  def index
    if params[:party]
      voters = Voter.where(party: params[:party])
    else
      voters = Voter.all
    end
    render json: voters
  end

  def show
    render json: Voter.find(params[:id])
  end

  def create
    v = Voter.create(voter_params)
    render json: Voter.all, status: :created
  end

  # private def restrict_access
  #    api_key = ApiKey.find_by_access_token(params[:access_token])
  #    head :unauthorized unless api_key
  #  end

  private def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
