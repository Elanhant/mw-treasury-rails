class PluginImage < ActiveRecord::Base
  belongs_to :plugin
  validates :url, presence: true

  def url
    if read_attribute(:url).nil?
      return read_attribute(:url)
    end
  	'http://127.0.0.1:3000/images/' + read_attribute(:url)
  end
end
