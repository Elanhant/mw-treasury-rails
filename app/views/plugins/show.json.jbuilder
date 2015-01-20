json.extract! @plugin, :id, :name, :author, :description, :version, :created_at, :updated_at, :plugin_images, :category
json.images @plugin.plugin_images do |image|
  json.extract! image, :id, :url
  json.set! :created_at, image.created_at.to_formatted_s(:short)
end

json.set! :created_at, @plugin.created_at.to_formatted_s(:long)
json.set! :category_id, @plugin.category ? @plugin.category.id : 0