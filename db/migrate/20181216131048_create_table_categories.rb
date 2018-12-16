class CreateTableCategories < ActiveRecord::Migration[5.2]

  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :code, null: false
    end
  end

end
