class AddCompanyToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :company, :string
  end
end
