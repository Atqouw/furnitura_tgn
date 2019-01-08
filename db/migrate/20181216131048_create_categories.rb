class CreateCategories < ActiveRecord::Migration[5.2]

  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :meta_description
      t.string :meta_key_words
      t.string :page_title


      t.timestamps null: false
    end
  end

end
