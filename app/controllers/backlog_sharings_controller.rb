class BacklogSharingsController < ApplicationController
  layout false
  respond_to :js

  def create
    @sharing = BacklogSharing.new(backlog_sharing_params)
    if can? :manage, @sharing.backlog
      @sharing.save!
    else
      # TODO: better error handling
      raise CanCan::AccessDenied.new("Not authorized!", :manage, @sharing.backlog)
    end
  rescue => e
    @exception = e
  end

  def backlog_sharing_params
    params.require(:backlog_sharing).permit(:user_email, :backlog_id)
  end
end