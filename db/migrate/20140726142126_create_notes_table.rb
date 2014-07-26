class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |c|
      c.string :note_img
      c.string :course_id
      c.integer :user_id
      c.timestamps
    end
  end
end
