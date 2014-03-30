class AddStartedAndCompletedToStories < ActiveRecord::Migration
  def change
    add_column :stories, :started_at,   :datetime
    add_column :stories, :compleated_at, :datetime
  end
end
