class CreateUniversitiesTable < ActiveRecord::Migration
  def change
    create_table :universities do |c|
      c.string :school_name
      c.timestamps
    end
  end
end
