class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.integer :credit

      t.timestamps null: false
    end
  end
end
