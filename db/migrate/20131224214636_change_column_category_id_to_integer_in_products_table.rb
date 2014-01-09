class ChangeColumnCategoryIdToIntegerInProductsTable < ActiveRecord::Migration
  def change
	change_column :products, :category_id, 'integer USING CAST(category_id AS integer)'
  end
end
