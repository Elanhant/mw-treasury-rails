json.array!(@plugins) do |plugin|
  json.extract! plugin, :id, :name, :author, :description, :version
  json.url plugin_url(plugin, format: :json)
end
