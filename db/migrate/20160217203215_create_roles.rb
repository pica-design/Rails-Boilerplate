class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :capabilities

      t.timestamps null: false
    end
  end
end
