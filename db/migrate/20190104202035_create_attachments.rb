class CreateAttachments < ActiveRecord::Migration[5.2]

  def change
    create_table :attachments do |t|
      t.references  :attachable,  polymorphic: true
      t.string :attach, null: false
      t.string :title

      t.timestamps null: false
    end
  end

end
