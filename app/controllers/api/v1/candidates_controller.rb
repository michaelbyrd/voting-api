class Api::V1::CandidatesController < ApplicationController
  def index
    if params[:party]
      candidates = Candidate.where(party: params[:party])
    else
      candidates = Candidate.all
    end
    render json: candidates
  end

  def show
    c = Candidate.find(params[:id])
    render json: c if c
  end

  def create
    c = Candidate.new(candidate_params)
    if c.save
      render json: c, status: :created
    else
      render json: "Invalid parameters", status: 400
    end
  end

  private def candidate_params
    params.require(:candidate).permit(:name, :party)
  end
end
