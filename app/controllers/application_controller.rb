class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    flash[:alert] = "Not Found"
    redirect_to(request.referer || root_path)
  end
end
