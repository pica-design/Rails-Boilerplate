class Attachment < Post
  has_attached_file :file, style: {thumbnail: "150x150>", medium: "300x300>", large: "1024x1024>"}, preserve_files: "true"

  before_post_process :skip_for_audio

  def skip_for_audio
    ! %w(audio/ogg application/ogg).include?(asset_content_type)
  end

  validates_attachment :file, presence: true,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
