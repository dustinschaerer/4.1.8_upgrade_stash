class AddPayFirstnameToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :pay_firstname, :string
    add_column :purchases, :pay_lastname, :string
    add_column :purchases, :pay_company, :string
    add_column :purchases, :pay_telephone, :string
    add_column :purchases, :pay_status, :string
    add_column :purchases, :status, :string
  end
end
