class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :dimension
      t.integer :minimum

      t.timestamps
    end
  end
end
