json.array!(@categories) do |category|
  json.extract! category, :id, :name, :plugins_count
  json.imageUrl category.image_url
end
