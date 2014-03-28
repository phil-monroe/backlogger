class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['HTTP_USER'] || 'phil', password: ENV['HTTP_PASSWORD'] || 'secret'
end
