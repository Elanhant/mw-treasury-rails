class PluginLink < ActiveRecord::Base
  belongs_to :plugin, touch: true

  validates :name, length: { maximum: 60 }, presence: true
  validates :url, presence: true
end
