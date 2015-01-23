class CreatePluginLinks < ActiveRecord::Migration
  def change
    create_table :plugin_links do |t|
      t.string :name
      t.string :url
      t.references :plugin, index: true

      t.timestamps
    end
  end
end
