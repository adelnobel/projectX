class AddIndexToTableName < ActiveRecord::Migration
  def change
    add_index "user_items", ["user_id", "item_id"], :unique => true
  end
end
