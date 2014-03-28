class Story < ActiveRecord::Base
  belongs_to :backlog

  def overview
    ["As a #{who}", "I want #{what}", "So that #{why}"].join(?\n)
  end

  def roi
    self.business_value.to_i / self.story_points.to_i
  rescue
    0
  end
end
