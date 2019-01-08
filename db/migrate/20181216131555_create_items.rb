class CreateItems < ActiveRecord::Migration[5.2]

  create_table :items do |t|
    t.string :name, null: false
    t.string :short_description
    t.string :full_description
    t.string :photo
    t.string :article
    t.string :meta_description
    t.string :meta_key_words
    t.string :page_title

    t.monetize :sale_price

    t.float :discount_percent

    t.boolean :is_sell_out, null: false, default: false
    t.boolean :is_show_on_main_slider, null: false, default: false

    t.timestamps null: false
  end

end
