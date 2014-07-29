class AddUpvotesToNotes < ActiveRecord::Migration
  def change
      add_column :notes, :upvotes, :integer
    end
end
