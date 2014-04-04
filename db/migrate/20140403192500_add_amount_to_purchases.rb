class AddAmountToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :amount, :integer
    add_column :purchases, :state, :string, :default => 'pending'
  end
end
