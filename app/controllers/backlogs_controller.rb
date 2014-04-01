class BacklogsController < ApplicationController
  def index
    @backlogs = current_user.backlogs.load
  end

  def show
    @backlog = current_user.backlogs.find(params[:id])
  end

  def create
    backlog = current_user.backlogs.create(backlog_params)
    redirect_to [current_user, backlog]
  end

  def update
    backlog = current_user.backlogs.find(params[:id])
    story_ids = params[:backlog][:story_order].split(',').map(&:to_i)
    backlog.story_order = story_ids
    backlog.save
    redirect_to [current_user, backlog]
  end

  private

  def backlog_params
    params.require(:backlog).permit(:name)
  end
end
