class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :promotion_codes
      t.string :discount_codes
      t.string :status
      t.references :store, foreign_key: true
     
      t.timestamps
    end
  end
end
