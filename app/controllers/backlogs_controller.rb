class BacklogsController < ApplicationController
  layout false, only: :cards

  def index
    @backlogs = current_user.backlogs + current_user.shared_backlogs
  end

  def show
    @backlog = Backlog.find(params[:id])
    if cannot?(:read, @backlog)
      flash[:danger] = 'you cannot access that backlog'
      redirect_to user_backlogs_path(current_user)
    end
  end

  def cards
    @stories = current_user.backlogs.find(params[:id]).stories.uncompleted
    @stories = @stories.where(id: params[:stories].split(?,).map(&:to_i)) if params[:stories]
  end

  def create
    backlog = current_user.backlogs.create(backlog_params)
    redirect_to [current_user, backlog]
  end

  def update
    backlog = Backlog.find(params[:id])
    if can?(:edit, backlog)
      story_ids = params[:backlog][:story_order].split(',').map(&:to_i)
      backlog.story_order = story_ids
      backlog.save
      redirect_to [current_user, backlog]
    else
      flash[:danger] = 'you cannot edit that backlog'
      redirect_to user_backlog_path(current_user, backlog)
    end
  end

  private

  def backlog_params
    params.require(:backlog).permit(:name)
  end
end
