class Story < ActiveRecord::Base
  belongs_to :backlog, touch: true
  TABLE = self.arel_table


  scope :uncompleted,  ->{ where(TABLE[:compleated_at].eq(nil)) }
  scope :compleated,   ->{ where(TABLE[:compleated_at].not_eq(nil)) }

  validates :compleated_at, compleation: true

  def overview
    ["As a #{who}", "I want #{what}", "So that #{why}"].join(?\n)
  end

  def roi
    self.business_value.to_i / self.story_points.to_i
  rescue
    0
  end

  def compleated= val
    self.compleated_at = Time.now if val == true
  end

  def started= val
    self.started_at = Time.now if val == true
  end
end
