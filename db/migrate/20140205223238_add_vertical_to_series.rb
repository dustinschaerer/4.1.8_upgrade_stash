class AddVerticalToSeries < ActiveRecord::Migration
   def up
  	add_column :series, :vertical, :string, default: "nil"
  end

  def down
  	remove_column :series, :vertical
  end
end
