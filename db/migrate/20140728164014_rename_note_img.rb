class RenameNoteImg < ActiveRecord::Migration
  def change
      rename_column :notes, :note_img, :file
    end
end
