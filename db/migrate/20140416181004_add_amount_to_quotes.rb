class AddAmountToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :amount, :integer
  end
end
