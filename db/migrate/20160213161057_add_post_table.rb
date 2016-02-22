class AddPostTable < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.integer :user_id, null: false, default: 1
      t.integer :attachment_id
      t.text :content
      t.text :title
      t.text :excerpt
      t.string :status, null: false, default: "draft"
      t.integer :parent, null: false, default: 0
      t.integer :menu_order, null: false, default: 1

      t.timestamps null: false
    end
  end
end
