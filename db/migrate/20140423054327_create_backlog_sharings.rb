class CreateBacklogSharings < ActiveRecord::Migration
  def change
    create_table :backlog_sharings do |t|
      t.integer :user_id
      t.integer :backlog_id
      t.timestamps
    end
  end
end
