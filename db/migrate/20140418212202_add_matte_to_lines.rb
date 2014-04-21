class AddMatteToLines < ActiveRecord::Migration
  def change
    add_column :lines, :finish, :string
    add_column :lines, :laminate_side, :string
  end
end
