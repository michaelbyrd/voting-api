class Api::V1::RacesController < ApplicationController
  def index
    render json: Race.all
  end

  def show
    r = Race.find(params[:id])
    if r
      render json: r
    else
      render json: "Invalid params", status: 400
    end
  end

  def create
    r = Race.new(race_params)
    if r.save
      render json: r, status: :created
    else
      render json: "Invalid params", status: 400
    end
  end

  private def race_params
    params.require(:race).permit(:title, :start_at, :end_at)
  end
end
