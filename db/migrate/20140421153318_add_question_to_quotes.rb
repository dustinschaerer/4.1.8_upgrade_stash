class AddQuestionToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :question, :text
  end
end
