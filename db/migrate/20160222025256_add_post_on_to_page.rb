class AddPostOnToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :post_on, :datetime
    add_index :pages, :post_on
  end
  def self.down
    remove_column :pages, :post_on
  end
end