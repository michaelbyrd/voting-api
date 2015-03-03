class Api::V1::VotersController < ApplicationController
  respond_to :json

  def index
    if params[:party]
      voters = Voter.where(party: params[:party])
    else
      voters = Voter.all
    end
    render json: voters
  end

  def show
    v = Voter.find(params[:id])
    render json: v if v
  end

  def create
    v = Voter.new(voter_params)
    if v.save
      render json: v, status: :created
    else
      render json: "Invalid params", status: 400
    end
  end

  private def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
