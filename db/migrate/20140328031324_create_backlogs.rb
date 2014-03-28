class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|
      t.string :name
      t.text :story_order

      t.timestamps
    end
  end
end
