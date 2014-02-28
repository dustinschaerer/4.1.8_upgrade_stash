class ChangeColumnFormatInLaminates < ActiveRecord::Migration
  def up
   change_column :laminates, :drop, :string
  end

  def down
   change_column :laminates, :drop, :integer
  end
end
