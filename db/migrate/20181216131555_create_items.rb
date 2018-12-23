class CreateItems < ActiveRecord::Migration[5.2]

  create_table :items do |t|
    t.string :name, null: false
    t.string :description
  end

end
