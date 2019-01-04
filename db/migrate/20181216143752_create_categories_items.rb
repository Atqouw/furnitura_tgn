class CreateCategoriesItems < ActiveRecord::Migration[5.2]

  def change
    create_table :categories_items do |t|
      t.references :category, null: false, forigin_key: true
      t.references :item, null: false, forigin_key: true

      t.timestamps null: false
    end
  end

end
