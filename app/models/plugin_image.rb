class PluginImage < ActiveRecord::Base
  belongs_to :plugin

  def url
  	'http://127.0.0.1:3000/images/' + read_attribute(:url)
  end
end
