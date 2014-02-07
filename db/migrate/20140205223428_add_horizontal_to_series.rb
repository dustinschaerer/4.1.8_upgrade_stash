class AddHorizontalToSeries < ActiveRecord::Migration
  def up
  	add_column :series, :horizontal, :string, default: "nil"
  end

  def down
  	remove_column :series, :horizontal
  end
end
