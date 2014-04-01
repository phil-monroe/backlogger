class SessionsController < ApplicationController

  skip_before_filter :require_user, only: [:google]

  def google
    user = User.from_google_omniauth(auth_hash)
    login(user)
    redirect_to user_backlogs_path(user)
  end

  def destroy
    logout
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
