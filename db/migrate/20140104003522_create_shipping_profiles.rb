class CreateShippingProfiles < ActiveRecord::Migration
  def change
    create_table :shipping_profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :company
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
