class AddQuoteIdToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :quote, index: true
  end
end
