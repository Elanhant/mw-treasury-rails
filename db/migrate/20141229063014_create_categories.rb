class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end

    add_column :plugins, :category_id, :integer
  end
end
