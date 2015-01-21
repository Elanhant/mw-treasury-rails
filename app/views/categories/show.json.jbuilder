json.extract! @category, :id, :name, :created_at, :updated_at, :image_url
json.plugins @category.plugins, partial: 'categories/plugin', as: :plugin