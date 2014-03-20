class CreateQuoteProducts < ActiveRecord::Migration
  def change
    create_table :quote_products do |t|
      t.string :name
      t.integer :group

      t.timestamps
    end
  end
end
