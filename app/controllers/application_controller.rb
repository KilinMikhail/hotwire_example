class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized

  def not_found
    flash[:alert] = "Not Found"
    redirect_to(request.referer || root_path)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end
end
