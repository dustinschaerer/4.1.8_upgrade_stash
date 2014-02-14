class AddSortToStyles < ActiveRecord::Migration
  def up
  	add_column :styles, :sort, :integer
  end

  def down
  	remove_column :styles, :sort
  end
end
