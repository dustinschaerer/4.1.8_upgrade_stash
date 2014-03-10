class AddSmallimageToSeries < ActiveRecord::Migration
  def change
    add_column :series, :smallimage, :string
  end
end
