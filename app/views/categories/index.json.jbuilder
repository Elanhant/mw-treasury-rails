json.array!(@categories) do |category|
  json.extract! category, :id, :name
  json.imageUrl category.image_url
end
