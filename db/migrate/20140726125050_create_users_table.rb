class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |c|
      c.string :first_name
      c.string :last_name
      c.string :username
      c.string :email
      c.string :password
      c.string :integer
      c.timestamps
    end
  end
end
