class SessionsController < ApplicationController
  def google
    user = User.from_google_omniauth(auth_hash)
    login(user)
    redirect_to user_backlogs_path(user)
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
