json.details do
    json.attachment_info @attachment.attributes
    json.url @attachment.file.url(:thumb)
end