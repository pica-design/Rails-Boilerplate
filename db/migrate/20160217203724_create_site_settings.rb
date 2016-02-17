class CreateSiteSettings < ActiveRecord::Migration
  def change
    create_table :site_settings do |t|
      t.string :option_name
      t.text :option_value

      t.timestamps null: false
    end
  end
end
