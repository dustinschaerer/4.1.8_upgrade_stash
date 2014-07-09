class RemoveShippingProfiles < ActiveRecord::Migration
  def down
    drop_table :shipping_profiles
  end

  def up
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

    add_index "shipping_profiles", ["user_id"], name: "index_shipping_profiles_on_user_id", using: :btree
  end
end
