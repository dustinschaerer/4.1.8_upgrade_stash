class AddIndicesToVinylrolls < ActiveRecord::Migration
  def change
  	add_index :vinylrolls, :series_id
  	add_index :vinylrolls, :color_id
  end
end
