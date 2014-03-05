class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :user, index: true
      t.string :firstname
      t.string :lastname
      t.string :telephone
      t.string :contactby
      t.string :ship_street_address
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zipcode
      t.string :ship_country
      t.string :pay_street_address
      t.string :pay_city
      t.string :pay_state
      t.string :pay_zipcode
      t.string :pay_country
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :sales_tax
      t.decimal :total
      t.string :pay_type

      t.timestamps
    end
  end
end
