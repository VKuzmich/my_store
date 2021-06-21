class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.integer :quantity

      t.timestamps
    end
    drop_table :carts_items
  end
end
