class CreateQuotecarts < ActiveRecord::Migration
  def change
    create_table :quotecarts do |t|

      t.timestamps
    end
  end
end
