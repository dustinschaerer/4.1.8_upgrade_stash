class AddTaxIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :tax_id, :string
  end
end
