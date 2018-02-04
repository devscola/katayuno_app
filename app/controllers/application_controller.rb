class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path unless user_signed_in?
    redirect_to root_path unless current_user.admin?
  end
end
