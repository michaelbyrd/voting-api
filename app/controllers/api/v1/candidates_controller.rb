class Api::V1::CandidatesController < ApplicationController
  def index
    if params[:party]
      candidates = Candidate.where(party: params[:party])
    else
      candidates = Candidate.all
    end
    render json: candidates
  end
end
