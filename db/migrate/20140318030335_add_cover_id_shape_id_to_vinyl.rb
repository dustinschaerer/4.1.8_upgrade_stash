class AddCoverIdShapeIdToVinyl < ActiveRecord::Migration
  def change
    add_reference :vinyls, :cover, index: true
    add_reference :vinyls, :shape, index: true
  end
end
