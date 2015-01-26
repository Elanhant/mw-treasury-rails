json.array!(@plugins) do |plugin|
  json.extract! plugin, :id, :name, :author, :description, :version, :plugin_images, :category_id, :updated_at
  json.url plugin_url(plugin, format: :json)
  json.imageUrl plugin.plugin_images.empty? ? '' : plugin.plugin_images[0].url
end