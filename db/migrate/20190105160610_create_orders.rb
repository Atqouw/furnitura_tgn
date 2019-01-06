class CreateOrders < ActiveRecord::Migration[5.2]

  def change
    create_table :orders do |t|
      t.string :token

      t.integer :status, null: false, default: 0

      t.string :comment


      t.monetize :amount

      t.references :customer, null: true, forigin_key: true

      t.timestamps null: false
    end
  end

end
