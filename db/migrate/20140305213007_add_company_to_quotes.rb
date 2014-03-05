class AddCompanyToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :company, :string
  end
end
