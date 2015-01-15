json.extract! @plugin, :id, :name, :author, :description, :version, :created_at, :updated_at, :plugin_images, :category
json.images do
	json.array! @plugin.plugin_images, :url
end

json.set! :created_at, @plugin.created_at.to_formatted_s(:long)
json.set! :category_id, @plugin.category ? @plugin.category.id : 0