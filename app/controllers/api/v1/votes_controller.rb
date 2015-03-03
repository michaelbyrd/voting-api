class Api::V1::VotesController < ApplicationController
  def index
    render json: Vote.all
  end

  def show
    v = Vote.find(params[:id])
    render json: v if v
  end

  def create
    v = Vote.new(vote_params)
    if v.save
      render json: v, status: :created
    else
      render json: "Invalid params", status: 400
    end
  end

  private def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id)
  end
end
