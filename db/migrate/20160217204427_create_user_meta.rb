class CreateUserMeta < ActiveRecord::Migration
  def change
    create_table :user_meta do |t|
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
