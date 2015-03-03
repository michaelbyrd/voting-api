class Api::V1::CandidatesController < ApplicationController
  def index
    if params[:party]
      candidates = Candidate.where(party: params[:party])
    else
      candidates = Candidate.all
    end
    render json: candidates
  end

  def create
    c = Candidate.create(name: params[:name], party: params[:party])
    # v = Voter.create(voter_params)
    render json: Candidate.all, status: :created
  end

  # private def candidate_params
  #   params.require(:candidate).permit(:name, :party)
  # end
end
