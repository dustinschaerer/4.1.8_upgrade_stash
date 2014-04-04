class CreatePurchaseTransactions < ActiveRecord::Migration
  def change
    create_table :purchase_transactions do |t|
      t.references :purchase, index: true
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :reference
      t.string :message
      t.text :params
      t.boolean :test

      t.timestamps
    end
  end
end
