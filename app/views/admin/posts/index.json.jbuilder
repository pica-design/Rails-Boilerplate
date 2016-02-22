json.array!(@posts) do |admin_post|
  json.merge! admin_post.attributes
end
