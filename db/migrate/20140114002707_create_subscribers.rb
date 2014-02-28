class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.references :user, index: true
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
