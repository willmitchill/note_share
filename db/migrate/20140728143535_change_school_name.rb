class ChangeSchoolName < ActiveRecord::Migration
  def change
      remove_column :universities, :school_name, :name
    end
end
