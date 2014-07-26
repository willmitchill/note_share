class CreateCoursesTable < ActiveRecord::Migration
  def change
    create_table :courses do |c|
      c.string :school
      c.string :course_name
      c.timestamps
    end
  end
end
