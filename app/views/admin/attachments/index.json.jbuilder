json.array!(@attachments) do |admin_attachment|
  json.extract! admin_attachment, :id
  json.url admin_attachment_url(admin_attachment, format: :json)
end
