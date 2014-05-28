class Backlog < ActiveRecord::Base
  serialize :story_order, Array

  has_many :stories
  belongs_to :user

  has_many :backlog_sharings
  has_many :shared_users, through: :backlog_sharings, source: :user

  before_save do
    self.story_order = ordered_stories.compact.map(&:id)
  end

  def ordered_stories
    story_index = stories.uncompleted.inject(Hash.new) {|h, s| h[s.id] = s; h}
    story_order.map{|id| story_index[id]}.compact
  end

  def total_complexity
    stories.uncompleted.sum(:story_points)
  end
end
