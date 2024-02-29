class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.string :variant
      t.float :multiplier

      t.timestamps
    end
  end
end
