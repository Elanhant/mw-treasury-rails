class Plugin < ActiveRecord::Base
	validates :name, length: { maximum: 140 }, presence: true
	validates :version, length: { maximum: 10 }
end
