class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :slug
      t.text :items

      t.timestamps null: false
    end
  end
end
