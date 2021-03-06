class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session
  before_action :restrict_access



  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end


# private def restrict_access
#    api_key = ApiKey.find_by_access_token(params[:access_token])
#    head :unauthorized unless api_key
#  end
