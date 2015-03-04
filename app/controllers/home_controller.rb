class HomeController < ApplicationController
  protect_from_forgery with: :exception, only: :index
  skip_before_action :restrict_access, only: :index

  def index

  end
end


# puts ENV['VOTING_API_TOKEN']
# @races = RaceRequest.new.races
# @races = []
# @races = HTTParty.get("http://localhost:3000/api/v1/votes/",
#                         :headers => {
#                         "access_token" => ENV['VOTING_API_TOKEN']})
