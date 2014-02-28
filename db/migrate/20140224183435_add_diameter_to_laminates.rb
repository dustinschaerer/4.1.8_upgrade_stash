class AddDiameterToLaminates < ActiveRecord::Migration
  def up
  	add_column :laminates, :diameter, :integer
  end

  def down
  	remove_column :laminates, :diameter
  end
end