class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :require_user

  private
  def login(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def logout
    @current_user = nil
    reset_session
    redirect_to root_url
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end
  helper_method :current_user

  def require_user
    redirect_to auth_google_path unless current_user.present?
  end
end
