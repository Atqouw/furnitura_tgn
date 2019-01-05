class CreateItemsOrders < ActiveRecord::Migration[5.2]

  def change
    create_table :items_orders do |t|
      t.references :item, null: false, forigin_key: true
      t.references :order, null: false, forigin_key: true

      t.timestamps null: false
    end
  end

end
