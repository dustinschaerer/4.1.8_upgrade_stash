class ChangeNameToFirstnameInOrder < ActiveRecord::Migration
  def change
  	rename_column :orders, :name, :firstname
  end
end
