class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :meta
      t.integer :user_id, null: false, default: 1
      t.text :content
      t.text :filter_content
      t.string :password
      t.text :title
      t.text :excerpt
      t.string :status, null: false, default: nil
      t.integer :parent, null: false, default: nil
      t.string :guid
      t.integer :menu_order, null: false, default: nil

      t.timestamps null: false
    end
  end
end
