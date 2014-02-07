class AddSideToSeries < ActiveRecord::Migration
  def up
  	add_column :series, :side, :string, default: "nil"
  end

  def down
  	remove_column :series, :side
  end
end
