class AddPostOnToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :post_on, :datetime
    add_index :posts, :post_on
  end
  def self.down
    remove_column :posts, :post_on
  end
end
