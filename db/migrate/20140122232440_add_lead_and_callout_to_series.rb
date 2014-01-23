class AddLeadAndCalloutToSeries < ActiveRecord::Migration
  def up
  	add_column :series, :lead, :text, default: ""
  	add_column :series, :callout, :text, default: ""
  end

  def down
  	remove_column :series, :lead
  	remove_column :series, :callout
  end
end
