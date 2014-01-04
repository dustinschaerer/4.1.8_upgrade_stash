class AddIndexOnUserIdInShippingProfiles < ActiveRecord::Migration
  def change
  	add_index :shipping_profiles, :user_id
  end
end
