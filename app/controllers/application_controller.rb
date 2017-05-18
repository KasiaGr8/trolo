class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  def authenticate_user
    if current_user.blank?
      redirect_to new_session_path, alert: 'Please log in first!'
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
