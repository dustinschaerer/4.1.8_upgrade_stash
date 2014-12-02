class AddColorsCountToSeries < ActiveRecord::Migration
  def change
    add_column :series, :colors_count, :integer
  end
end
