class Story < ActiveRecord::Base
  belongs_to :backlog

  def roi
    self.business_value.to_i / self.story_points.to_i
  rescue
    0
  end
end
