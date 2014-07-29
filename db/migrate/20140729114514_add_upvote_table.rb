class AddUpvoteTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |c|
      c.integer :user_id
      c.integer :note_id
      c.timestamps
    end
  end
end
