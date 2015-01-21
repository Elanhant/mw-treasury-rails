class Category < ActiveRecord::Base
	has_many :plugins
  attr_readonly :plugins_count

  def image_url
    'http://127.0.0.1:3000/images/categories/' + read_attribute(:image_url)
  end
end
