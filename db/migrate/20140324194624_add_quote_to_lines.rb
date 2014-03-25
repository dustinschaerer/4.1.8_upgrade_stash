class AddQuoteToLines < ActiveRecord::Migration
  def change
    add_reference :lines, :quote, index: true
    add_reference :lines, :purchase, index: true
  end
end
