class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :item_id
      t.string :user_id
      t.text :body
      t.integer :rating

      t.timestamps null: false
    end
  end
end
