class UpdateColumnToImg < ActiveRecord::Migration
  def change
    rename_column :users, :integer, :image
  end
end
