class ChangeClColumnInPurchaseTransactions < ActiveRecord::Migration
  def up
  	remove_column :purchase_transactions, :reference
  	add_column :purchase_transactions, :authorization, :string
  end

  def down
  	remove_column :purchase_transactions, :authorization
  	add_column :purchase_transactions, :reference, :string
  end	
end
