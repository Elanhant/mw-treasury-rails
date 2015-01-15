class Category < ActiveRecord::Base
	has_many :plugins

  def image_url
    'http://127.0.0.1:3000/images/categories/' + read_attribute(:image_url)
  end
end
