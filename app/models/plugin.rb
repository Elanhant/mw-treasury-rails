class Plugin < ActiveRecord::Base
	belongs_to :category
	
	validates :name, length: { maximum: 140 }, presence: true
	validates :version, length: { maximum: 10 }
	validates :author, presence: true
	validates :description, presence: true
end
