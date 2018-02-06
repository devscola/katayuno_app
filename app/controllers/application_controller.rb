class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    unless current_user && user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end
end
