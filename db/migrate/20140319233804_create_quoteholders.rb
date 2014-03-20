class CreateQuoteholders < ActiveRecord::Migration
  def change
    create_table :quoteholders do |t|

      t.timestamps
    end
  end
end
