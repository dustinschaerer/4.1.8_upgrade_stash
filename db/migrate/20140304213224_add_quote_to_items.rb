class AddQuoteToItems < ActiveRecord::Migration
  def change
    add_reference :items, :quote, index: true
  end
end
