class AddSwapimageToSeries < ActiveRecord::Migration
  def change
    add_column :series, :swapimage, :string
  end
end
