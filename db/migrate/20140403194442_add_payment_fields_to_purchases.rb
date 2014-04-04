class AddPaymentFieldsToPurchases < ActiveRecord::Migration
  def change
  	add_column :purchases, :card_type, :string
    add_column :purchases, :card_expires_on, :date
    add_column :purchases, :ip_address, :string
  end
end
