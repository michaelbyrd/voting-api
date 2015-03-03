class Api::V1::VotesController < ApplicationController
  def index
    render json: Vote.all
  end

  def show
    render json: Vote.find(params[:id])
  end
end
