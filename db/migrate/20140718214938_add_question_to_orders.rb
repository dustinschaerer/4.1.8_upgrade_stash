class AddQuestionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :question, :text
  end
end
