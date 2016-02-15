require 'uri'

class Post < ActiveRecord::Base
  belongs_to :user #each post belong to at leaast 1 user
  attr_accessor :content
  attr_accessor :title
  attr_accessor :excerpt
  attr_accessor :author
  attr_accessor :menu_order

  #validations
  validates :author, presence: true
  validates :status, presence: true
  validates :guid, presence: true, format: { :with => URI.regexp(%w(http https)), :message => "Valid GUID required" }
  validates :menu_order, presence: true, uniqueness: true

end
