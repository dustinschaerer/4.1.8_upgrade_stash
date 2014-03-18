class RemoveCoverAndShapeFromVinyl < ActiveRecord::Migration
  def change
  	remove_column :vinyls, :cover, :string
  	remove_column :vinyls, :shape, :string
  end
end
