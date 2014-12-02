class CacheColorsCount < ActiveRecord::Migration
  def up
    Series.all.each { |s| Series.reset_counters(s.id, :colors) } 
  end

  def down
  end
end
