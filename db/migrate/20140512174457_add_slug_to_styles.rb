class AddSlugToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :slug, :string
  	add_index :styles, :slug
  end
end