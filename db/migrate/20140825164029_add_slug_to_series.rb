class AddSlugToSeries < ActiveRecord::Migration
  def change
    add_column :series, :slug, :string
  end
end
