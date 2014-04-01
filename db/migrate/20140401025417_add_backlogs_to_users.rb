class AddBacklogsToUsers < ActiveRecord::Migration
  def change
    add_column :backlogs, :user_id, :integer
    add_index  :backlogs, :user_id
  end
end
