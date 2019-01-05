class CreateCustomers < ActiveRecord::Migration[5.2]

  def change
    create_table :customers do |t|
      t.string :phone, null: false
      t.string :email
      t.string :name

      t.timestamps null: false
    end
  end

end
