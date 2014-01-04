class RemoveCategoryColumnToStyles < ActiveRecord::Migration
  def change
  	remove_column :styles, :category 
  end
end
