class CreatePluginFiles < ActiveRecord::Migration
  def change
    create_table :plugin_files do |t|
      t.string :name
      t.references :plugin, index: true
      t.integer :size
      t.string :path

      t.timestamps
    end
  end
end
