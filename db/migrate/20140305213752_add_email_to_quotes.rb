class AddEmailToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :email, :string
  end
end
