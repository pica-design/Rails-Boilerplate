class AddPostTable < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.integer :user_id, null: false, default: nil

      t.text :content
      t.text :title
      t.text :excerpt
      t.string :status, null: false, default: nil
      t.integer :parent, null: false, default: nil
      t.string :guid
      t.integer :menu_order, null: false, default: nil

      t.timestamps null: false
    end
    add_index :posts, :menu_order, unique: true
    add_index :posts, :guid, unique: true
  end
end
