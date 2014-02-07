class AddNotforupholsteryToColors < ActiveRecord::Migration
  def up
  	add_column :colors, :notforupholstery, :boolean, default: "false"
  end

  def down
  	remove_column :colors, :notforupholstery
  end
end
