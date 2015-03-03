class Api::V1::VotesController < ApplicationController
  def index
    render json: Vote.all
  end
end
