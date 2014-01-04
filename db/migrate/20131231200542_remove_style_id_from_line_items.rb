class RemoveStyleIdFromLineItems < ActiveRecord::Migration
  def change
  	remove_column :line_items, :style_id
  end
end
