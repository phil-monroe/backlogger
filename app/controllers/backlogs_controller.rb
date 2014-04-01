class BacklogsController < ApplicationController
  def index
    @backlogs = Backlog.all
  end

  def show
    @backlog = Backlog.find(params[:id])
  end

  def create
    backlog = Backlog.create(backlog_params)
    redirect_to [current_user, backlog]
  end

  def update
    backlog = Backlog.find(params[:id])
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
