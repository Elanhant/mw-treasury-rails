class CreatePluginImages < ActiveRecord::Migration
  def change
    create_table :plugin_images do |t|
      t.string :url
      t.references :plugin, index: true

      t.timestamps
    end
  end
end
