class RemoveNameColumnFromCourses < ActiveRecord::Migration
  def change
      remove_column :courses, :name
    end
end
