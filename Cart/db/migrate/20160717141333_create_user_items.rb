class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.string :user_id
      t.string :item_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
