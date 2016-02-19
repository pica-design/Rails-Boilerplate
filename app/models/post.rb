require 'uri'

class Post < ActiveRecord::Base
  belongs_to :user #each post belong to at leaast 1 user
  attr_accessor :content
  attr_accessor :title
  attr_accessor :excerpt
  attr_accessor :user_id
  attr_accessor :menu_order

end
