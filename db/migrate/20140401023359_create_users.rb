class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :google_uid

      t.timestamps
    end
    add_index :users, :google_uid
  end
end
