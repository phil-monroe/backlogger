class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['HTTP_USER'] || 'phil', password: ENV['HTTP_PASSWORD'] || 'secret'

  private
  def login(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user
end
