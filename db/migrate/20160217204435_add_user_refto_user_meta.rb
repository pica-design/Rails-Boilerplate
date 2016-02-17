class AddUserReftoUserMeta < ActiveRecord::Migration
  def change
    add_reference :user_meta, :user, index: true, foreign_key: true
  end
end
