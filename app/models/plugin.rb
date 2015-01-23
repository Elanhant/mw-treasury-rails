class Plugin < ActiveRecord::Base
	belongs_to :category, counter_cache: true
  has_many :plugin_images
  has_many :plugin_files
	has_many :plugin_links
	
	validates :name, length: { maximum: 140 }, presence: true
	validates :version, length: { maximum: 10 }
	validates :author, presence: true
	validates :description, presence: true
end
