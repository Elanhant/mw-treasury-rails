json.extract! @category, :id, :name, :created_at, :updated_at, :image_url
json.plugins @category.plugins do |plugin|
  json.extract! plugin, :id, :name, :description, :plugin_images
end