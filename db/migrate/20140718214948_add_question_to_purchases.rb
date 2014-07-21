class AddQuestionToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :question, :text
  end
end
