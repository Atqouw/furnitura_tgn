class Items < ActiveRecord::Migration[5.2]

  create_table :items do |t|
    t.string :item
  end

end
