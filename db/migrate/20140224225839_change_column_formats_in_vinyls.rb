class ChangeColumnFormatsInVinyls < ActiveRecord::Migration
  def up
   change_column :vinyls, :drop, :string
  end

  def down
   change_column :vinyls, :drop, :integer
  end

end