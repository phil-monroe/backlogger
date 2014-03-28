class StoriesController < ApplicationController
  def create
    story = backlog.stories.create(story_params)
    backlog.story_order << story.id
    backlog.save!
    redirect_to backlog
  end

  def update
    story = backlog.stories.find(params[:id])
    story.update_attributes(story_params)
    redirect_to backlog
  end

  def destroy
    story = backlog.stories.find(params[:id])
    backlog.story_order.delete story.id
    backlog.save
    story.destroy
    redirect_to backlog
  end


  private

  def backlog
    @backlog ||= Backlog.find(params[:backlog_id])
  end

  def story_params
    params.require('story').permit!
  end
end
