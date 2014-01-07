class ChangeDefaultValueOnUsernameInUsers < ActiveRecord::Migration
  def change
  	change_column_default(:users, :username, nil)
  end
end
