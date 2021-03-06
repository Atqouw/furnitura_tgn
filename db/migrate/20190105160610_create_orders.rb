class CreateOrders < ActiveRecord::Migration[5.2]

  def change
    create_table :orders do |t|
      t.string :token
      t.string :customer_phone
      t.string :customer_name
      t.text :comment

      t.integer :status, null: false, default: 0

      t.monetize :amount

      t.references :customer, null: true, forigin_key: true

      t.timestamps null: false
    end
  end

end
