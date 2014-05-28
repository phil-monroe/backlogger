class StoriesController < ApplicationController
  def create
    story = backlog.stories.create(story_params)
    backlog.story_order << story.id
    backlog.save!
    redirect_to [current_user, backlog]
  end

  def update
    if can? :edit, backlog
      story = backlog.stories.find(params[:id])
      puts story_params.inspect
      story.update_attributes(story_params)
    else
      flash[:danger] = "no"
    end
    redirect_to [current_user, backlog]
  end

  def destroy
    story = backlog.stories.find(params[:id])
    backlog.story_order.delete story.id
    backlog.save
    story.destroy
    redirect_to [current_user, backlog]
  end


  private

  def backlog
    @backlog ||= Backlog.find(params[:backlog_id])
  end

  def story_params
    p = params.require('story').permit([:title, :who, :what, :why, :acceptance_criteria, :notes, :theme, :sprint_ready, :story_points, :business_value, :backlog_id, :created_at, :updated_at, :compleated, :started])
    p[:compleated] = p[:compleated] == 'true' if p[:compleated].present?
    p[:started] = p[:started] == 'true' if p[:started].present?
    p
  end
end
