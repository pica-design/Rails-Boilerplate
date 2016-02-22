require 'uri'

class Post < ActiveRecord::Base
  belongs_to :user #each post belong to at leaast 1 user
  has_many :attachments
  has_permalink(:title, true)

end
