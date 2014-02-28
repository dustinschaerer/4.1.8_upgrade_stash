class AddDiameterToVinyls < ActiveRecord::Migration
  def up
  	add_column :vinyls, :diameter, :integer
  end

  def down
  	remove_column :vinyls, :diameter
  end
end
