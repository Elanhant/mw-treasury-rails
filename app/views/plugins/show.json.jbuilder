json.extract! @plugin, :id, :name, :author, :description, :version, :created_at, :updated_at, :plugin_images
json.images do
	json.array! @plugin.plugin_images, :url
end

json.set! :category_id, @plugin.category ? @plugin.category.id : 0