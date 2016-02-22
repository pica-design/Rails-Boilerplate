class Attachment < ActiveRecord::Base
  belongs_to :user
  has_one :post
  has_one :page

  attr_accessor :file
  attr_accessor :file_file_name
  attr_accessor :file_content_type

  has_attached_file :file,
    :path => ":rails_root/public/system/:class/:attachment/:id/:basename_:style.:extension",
    :url => "/system/:class/:attachment/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['150x150#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

  validates_attachment :file,
    :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  validates :file_file_name,
    :presence => true,
    :uniqueness => true

end
