class RemoveUserIdFromSubscribers < ActiveRecord::Migration
  def change
    remove_reference :subscribers, :user, index: true
  end
end
