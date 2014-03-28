class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :who
      t.string :what
      t.string :why
      t.text :acceptance_criteria
      t.text :notes
      t.string :theme
      t.boolean :sprint_ready
      t.boolean :completed
      t.integer :story_points
      t.integer :business_value

      t.integer :backlog_id

      t.timestamps
    end
  end
end
