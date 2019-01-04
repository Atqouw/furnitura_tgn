class CreateItems < ActiveRecord::Migration[5.2]

  create_table :items do |t|
    t.string :name, null: false
    t.string :description

    t.monetize :sale_price

    t.float :discount_percent

    t.boolean :is_sell_out, null: false, default: false

    t.timestamps null: false
  end

end
