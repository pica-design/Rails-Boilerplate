json.array!(@posts) do |admin_post|
  json.extract! admin_post, :id
end
