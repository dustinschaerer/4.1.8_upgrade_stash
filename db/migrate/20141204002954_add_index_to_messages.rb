class AddIndexToMessages < ActiveRecord::Migration
  def change
    add_index :messages, :quote_id
  end
end
