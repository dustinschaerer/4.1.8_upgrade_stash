class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :name
      t.integer :order_id
      t.integer :quote_id
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
