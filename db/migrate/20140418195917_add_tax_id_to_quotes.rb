class AddTaxIdToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :tax_id, :string
  end
end
