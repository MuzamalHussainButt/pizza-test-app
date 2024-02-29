class AddReferencesToItemAndPrice < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :order_id, :bigint
    add_column :prices, :item_id, :bigint
  end
end
