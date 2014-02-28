class AddReasonToMessages < ActiveRecord::Migration
  def up
  	add_column :messages, :reason, :string
  end

  def down
  	remove_column :messages, :reason
  end
end
