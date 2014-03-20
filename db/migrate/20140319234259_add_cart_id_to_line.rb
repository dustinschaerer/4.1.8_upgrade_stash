class AddCartIdToLine < ActiveRecord::Migration
  def change
  	 add_reference :lines, :quoteholder, index: true
  end
end
