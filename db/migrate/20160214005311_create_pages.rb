class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
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
    add_index :pages, :menu_order, unique: true
    add_index :pages, :guid, unique: true
  end
end
