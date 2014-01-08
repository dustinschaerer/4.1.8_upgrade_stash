class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :quotecart, index: true
      t.integer :itemable_id
      t.string :itemable_type

      t.timestamps
    end
  end
end
